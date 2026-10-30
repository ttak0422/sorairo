import copy
import json
import os
import unittest
from pathlib import Path
from colour import lab, hex_lab, contrast, gamut
from palettes import pairs, resolved, hx

OUTPUT = Path(os.environ["SORAIRO_SOLAR_OUTPUT"])


class ColourTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.baseline = json.loads((OUTPUT / "highlights.json").read_text())
        cls.palettes = json.loads((OUTPUT / "palettes.json").read_text())

    def test_known_oklab_primary_vectors(self):
        # Ottosson 2021 matrices, independent published primary reference values.
        for colour, expected in (
            ("#ff0000", (0.627955, 0.224863, 0.125846)),
            ("#00ff00", (0.866440, -0.233888, 0.179498)),
            ("#0000ff", (0.452014, -0.032457, -0.311528)),
        ):
            for got, want in zip(lab(colour), expected):
                self.assertAlmostEqual(got, want, places=5)

    def test_hex_round_trip(self):
        for r in (0, 1, 64, 128, 254, 255):
            for g in (0, 128, 255):
                for b in (0, 128, 255):
                    colour = f"#{r:02x}{g:02x}{b:02x}"
                    self.assertEqual(hex_lab(lab(colour))[0], colour)

    def test_contrast_black_white_and_symmetry(self):
        self.assertEqual(contrast("#000000", "#ffffff"), 21)
        self.assertEqual(contrast("#123456", "#123456"), 1)
        self.assertEqual(contrast("#123456", "#abcdef"), contrast("#abcdef", "#123456"))

    def test_out_of_gamut_chroma_reduction(self):
        value = (0.6, 0.5, 0.5)
        self.assertFalse(gamut(value))
        colour, mapped = hex_lab(value)
        self.assertTrue(mapped)
        self.assertTrue(gamut(lab(colour)))
        self.assertAlmostEqual(lab(colour)[0], 0.6, delta=0.003)
        for invalid in ((float("nan"), 0, 0), (-0.1, 0, 0), (1.1, 0, 0)):
            with self.assertRaises(ValueError):
                hex_lab(invalid)

    def test_every_candidate_text_pair_after_rounding(self):
        for mode, states in self.palettes.items():
            self.assertEqual(len(states), 64)
            for state in states:
                for pair in pairs(state["groups"]):
                    self.assertGreaterEqual(pair["ratio"], 4.5, (state["id"], pair))

    def test_no_opposite_polarity_fade_and_monotonic_surface(self):
        for mode, states in self.palettes.items():
            levels = []
            for state in states:
                normal = resolved(state["groups"], "Normal")
                levels.append(lab(hx(normal["bg"]))[0])
                if mode == "light":
                    self.assertGreater(normal["bg"], normal["fg"])
                else:
                    self.assertGreater(normal["fg"], normal["bg"])
            self.assertTrue(all(a <= b + 0.0001 for a, b in zip(levels, levels[1:])))
            self.assertNotEqual(levels[0], levels[-1])

    def test_semantic_foregrounds_and_links_styles_fixed(self):
        for mode, states in self.palettes.items():
            baseline = self.baseline[mode]["groups"]
            for name, attrs in baseline.items():
                for state in states:
                    new = state["groups"][name]
                    for key in attrs:
                        if key not in ("fg", "bg", "sp"):
                            self.assertEqual(new[key], attrs[key])
                    if "fg" in attrs:
                        self.assertEqual(new["fg"], states[0]["groups"][name]["fg"])

    def test_current_failures_disclosed_not_relabelled(self):
        before = copy.deepcopy(self.baseline)
        light = pairs(self.baseline["light"]["groups"])
        comment = next(
            p for p in light if p["group"] == "Comment" and p["context"] == "Normal"
        )
        diff = next(p for p in light if p["group"] == "DiffAdd")
        self.assertAlmostEqual(comment["ratio"], 3.1537, delta=0.001)
        self.assertAlmostEqual(diff["ratio"], 2.765, delta=0.001)
        self.assertEqual(before, self.baseline)


if __name__ == "__main__":
    unittest.main()
