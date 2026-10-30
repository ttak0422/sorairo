import os
from pathlib import Path
import subprocess
import unittest


class EntrypointTests(unittest.TestCase):
    def test_normal_colorscheme_load_does_not_start_experiment(self):
        env = os.environ.copy()
        env.pop("SORAIRO_SOLAR_EXPERIMENT", None)
        script = Path(__file__).resolve().parent / "static.lua"
        result = subprocess.run(
            ["nvim", "--headless", "-u", "NONE", "-i", "NONE", "-n", "-l", str(script)],
            env=env,
            capture_output=True,
            text=True,
        )
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_explicit_opt_in_required_before_allocating_artifacts(self):
        env = os.environ.copy()
        env.pop("SORAIRO_SOLAR_EXPERIMENT", None)
        script = Path(__file__).resolve().parents[1] / "run.sh"
        result = subprocess.run(
            ["sh", str(script)], env=env, capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 2)
        self.assertIn("Opt in", result.stderr)
        self.assertNotIn("Artifacts:", result.stdout)


if __name__ == "__main__":
    unittest.main()
