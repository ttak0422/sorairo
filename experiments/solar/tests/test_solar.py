import math
import unittest
from datetime import datetime, timezone, timedelta
from zoneinfo import ZoneInfo
from solar import altitude, select, Reevaluator

TOKYO = (35.68, 139.69)  # explicit synthetic fixture, never a user default
SYDNEY = (-33.87, 151.21)


def dt(s):
    return datetime.fromisoformat(s)


class SolarTests(unittest.TestCase):
    def test_independent_nrel_reference(self):
        # NREL/TP-560-34302 Table A5.1, 2003-10-17 12:30:30 UTC-7.
        # Published apparent zenith=50.11162 => apparent altitude=39.88838.
        # Prototype is unrefracted/geocentric: use a loose .05 degree tolerance,
        # not the SPA accuracy claim. No SPA implementation code used.
        value = altitude(dt("2003-10-17T19:30:30+00:00"), 39.742476, -105.1786)
        self.assertAlmostEqual(value, 39.88838, delta=0.05)

    def test_tokyo_absolute_seasonal_noon(self):
        summer = select(dt("2026-06-21T03:00:00+00:00"), TOKYO)
        winter = select(dt("2026-12-21T03:00:00+00:00"), TOKYO)
        self.assertGreater(summer["altitude"], 75)
        self.assertLess(winter["altitude"], 32)
        self.assertGreater(summer["index"], winter["index"])

    def test_southern_seasons_reversed(self):
        june = select(dt("2026-06-21T02:00:00+00:00"), SYDNEY)
        december = select(dt("2026-12-21T02:00:00+00:00"), SYDNEY)
        self.assertGreater(december["index"], june["index"])

    def test_four_phases_half_hour_sampling(self):
        start = dt("2026-03-20T00:00:00+00:00")
        phases = {
            select(start + timedelta(minutes=30 * i), TOKYO)["phase"] for i in range(48)
        }
        self.assertEqual(phases, {"night", "dawn", "day", "dusk"})

    def test_poles_no_sunrise_required(self):
        for latitude, month, expected in (
            (90, 6, "day"),
            (90, 12, "night"),
            (-90, 6, "night"),
            (-90, 12, "day"),
        ):
            for hour in range(24):
                now = datetime(2026, month, 21, hour, tzinfo=timezone.utc)
                value = select(now, (latitude, 0))
                self.assertEqual(value["phase"], expected)
                self.assertTrue(math.isfinite(value["altitude"]))

    def test_timezone_representation_and_dst(self):
        for stamp in (
            "2026-03-08T06:59:00+00:00",
            "2026-03-08T07:01:00+00:00",
            "2026-11-01T05:30:00+00:00",
            "2026-11-01T06:30:00+00:00",
        ):
            now = dt(stamp)
            local = now.astimezone(ZoneInfo("America/New_York"))
            self.assertEqual(select(now, TOKYO), select(local, TOKYO))

    def test_utc_midnight_year_and_leap_boundary(self):
        for stamp in (
            "2028-02-28T23:59:00+00:00",
            "2028-02-29T23:59:00+00:00",
            "2026-12-31T23:59:00+00:00",
        ):
            now = dt(stamp)
            self.assertLess(
                abs(
                    altitude(now, *TOKYO) - altitude(now + timedelta(minutes=2), *TOKYO)
                ),
                0.6,
            )

    def test_longitude_date_line_and_quadrants(self):
        now = dt("2026-09-23T00:00:00+00:00")
        self.assertAlmostEqual(altitude(now, 0, -180), altitude(now, 0, 180), places=10)
        self.assertGreater(altitude(now, 0, 180), 85)
        self.assertLess(altitude(now, 0, 0), -85)

    def test_deterministic_missing_and_invalid_location(self):
        now = dt("2026-03-20T06:00:00+00:00")
        self.assertEqual(select(now)["mode"], "static")
        self.assertEqual(select(now, TOKYO), select(now, TOKYO))
        for loc in ((91, 0), (0, 181), (float("nan"), 0), (0, float("inf"))):
            with self.assertRaises(ValueError):
                select(now, loc)
        with self.assertRaises(ValueError):
            select(datetime(2026, 1, 1), TOKYO)
        with self.assertRaises(ValueError):
            select(datetime(1700, 1, 1, tzinfo=timezone.utc), TOKYO)

    def test_clock_jump_resume_and_cadence(self):
        r = Reevaluator(TOKYO)
        now = dt("2026-06-21T00:00:00+00:00")
        first = r.evaluate(now)
        self.assertIs(first, r.evaluate(now + timedelta(minutes=29)))
        due = now + timedelta(minutes=30)
        self.assertEqual(r.evaluate(due), select(due, TOKYO))
        later = now + timedelta(hours=16)
        self.assertEqual(r.evaluate(later, "resume"), select(later, TOKYO))
        earlier = now - timedelta(days=1)
        self.assertEqual(r.evaluate(earlier), select(earlier, TOKYO))

    def test_focus_bypasses_cadence(self):
        now = dt("2026-06-21T00:00:00+00:00")
        r = Reevaluator(TOKYO)
        r.evaluate(now)
        moment = now + timedelta(minutes=1)
        self.assertEqual(r.evaluate(moment, "focus"), select(moment, TOKYO))
        self.assertEqual(r.last_utc, moment)

    def test_freeze_bias_and_invalid_fallback(self):
        r = Reevaluator(TOKYO)
        now = dt("2026-12-21T03:00:00+00:00")
        first = r.evaluate(now)
        r.frozen = True
        self.assertIs(first, r.evaluate(now + timedelta(hours=12), "resume"))
        r.frozen = False
        r.bias = 0.1
        self.assertGreater(r.evaluate(now, "focus")["index"], first["index"])
        last = r.current
        r.location = (float("nan"), 0)
        self.assertIs(last, r.evaluate(now + timedelta(hours=1)))
        self.assertIs(last, r.evaluate(datetime(2026, 1, 1)))


if __name__ == "__main__":
    unittest.main()
