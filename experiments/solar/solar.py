"""Offline solar model. No clock, location discovery, I/O or network at import.

USNO approximate geocentric Sun + approximate GAST; UTC approximates UT1/TT.
Not a sunrise service: geometric centre altitude, no horizon/refraction model.
"""

import math
from datetime import datetime, timezone, timedelta


def altitude(instant, latitude, longitude):
    if (
        not isinstance(instant, datetime)
        or instant.tzinfo is None
        or instant.utcoffset() is None
    ):
        raise ValueError("timezone-aware instant required")
    if not (
        math.isfinite(latitude)
        and math.isfinite(longitude)
        and -90 <= latitude <= 90
        and -180 <= longitude <= 180
    ):
        raise ValueError("explicit finite latitude/longitude required")
    instant = instant.astimezone(timezone.utc)
    if not 1800 <= instant.year <= 2200:
        raise ValueError("outside approximate model window")
    jd = instant.timestamp() / 86400 + 2440587.5
    d = jd - 2451545
    rad = math.radians
    g = rad((357.529 + 0.98560028 * d) % 360)
    q = (280.459 + 0.98564736 * d) % 360
    lam = rad((q + 1.915 * math.sin(g) + 0.020 * math.sin(2 * g)) % 360)
    epsilon = rad(23.439 - 0.00000036 * d)
    ra = math.atan2(math.cos(epsilon) * math.sin(lam), math.cos(lam))
    dec = math.asin(math.sin(epsilon) * math.sin(lam))
    jd0 = math.floor(jd - 0.5) + 0.5
    h = (jd - jd0) * 24
    t = d / 36525
    gmst = (
        6.697375 + 0.065709824279 * (jd0 - 2451545) + 1.0027379 * h + 0.0000258 * t * t
    ) % 24
    omega = rad(125.04 - 0.052954 * d)
    mean_l = rad(280.47 + 0.98565 * d)
    eqeq = (-0.000319 * math.sin(omega) - 0.000024 * math.sin(2 * mean_l)) * math.cos(
        epsilon
    )
    hour = rad(((gmst + eqeq) * 15 + longitude) % 360) - ra
    lat = rad(latitude)
    sine = math.cos(hour) * math.cos(dec) * math.cos(lat) + math.sin(dec) * math.sin(
        lat
    )
    return math.degrees(math.asin(max(-1.0, min(1.0, sine))))


def select(instant, location=None, polarity="dark", bias=0):
    """Polarity is supplied by a future arbiter; this function never flips it.

    64 states cover absolute altitude -30..60 degrees, retaining winter/summer
    differences. Dawn/dusk use geometric -12..0; labels are tuning bands, not
    claims about local observed sunrise. Same-altitude dawn/dusk share colours.
    """
    if polarity not in ("light", "dark") or not math.isfinite(bias) or abs(bias) > 1:
        raise ValueError("invalid explicit polarity/bias")
    if location is None:
        return {"mode": "static", "polarity": polarity}
    a = altitude(instant, *location)
    rising = altitude(instant + timedelta(minutes=1), *location) >= altitude(
        instant - timedelta(minutes=1), *location
    )
    phase = (
        "day" if a >= 0 else ("night" if a < -12 else ("dawn" if rising else "dusk"))
    )
    value = max(0.0, min(1.0, (a + 30) / 90 + bias))
    return {
        "mode": "solar",
        "polarity": polarity,
        "phase": phase,
        "altitude": a,
        "rising": rising,
        "index": int(math.floor(value * 63 + 0.5)),
    }


class Reevaluator:
    """Deterministic clock-injected 30 min cadence; no missed-state replay."""

    def __init__(self, location=None, polarity="dark"):
        self.location, self.polarity = location, polarity
        self.last_utc = None
        self.current = {"mode": "static", "polarity": polarity}
        self.frozen = False
        self.bias = 0

    def evaluate(self, now, event="timer"):
        if (
            not isinstance(now, datetime)
            or now.tzinfo is None
            or now.utcoffset() is None
        ):
            return self.current
        now = now.astimezone(timezone.utc)
        due = (
            self.last_utc is None
            or event in ("start", "focus", "resume")
            or now < self.last_utc
            or (now - self.last_utc).total_seconds() >= 1800
        )
        if due and not self.frozen:
            try:
                candidate = select(now, self.location, self.polarity, self.bias)
            except (ValueError, TypeError, OverflowError):
                return self.current  # retain last-good/static on invalid input
            self.current, self.last_utc = candidate, now
        return self.current
