import csv
import hashlib
import json
import os
from pathlib import Path
from datetime import datetime, timezone, timedelta
from palettes import compile_states, pairs, resolved, hx
from colour import contrast
from solar import select

ROOT = Path(__file__).resolve().parent
OUTPUT = Path(os.environ["SORAIRO_SOLAR_OUTPUT"])
SOURCE = ROOT.parents[1] / "colors/sorairo.vim"


def generate():
    baseline = json.loads((OUTPUT / "highlights.json").read_text())
    # Lua table iteration order varies across isolated processes.
    (OUTPUT / "highlights.json").write_text(
        json.dumps(baseline, sort_keys=True, separators=(",", ":")) + "\n"
    )
    summary = {
        "source": "colors/sorairo.vim",
        "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
        "threshold": 4.5,
        "scope": "authored text foregrounds plus specified overlay contexts; no plugin namespace/terminal claim",
        "polarity": {},
    }
    all_states = {}
    rows = []
    for mode in ("light", "dark"):
        states, repairs, mapped = compile_states(baseline, mode)
        all_states[mode] = states
        current = pairs(baseline[mode]["groups"])
        actual = []
        for pair in current:
            rows.append(
                {
                    "kind": "current",
                    "state": mode,
                    **{k: v for k, v in pair.items() if k != "root"},
                }
            )
        for state in states:
            result = pairs(state["groups"])
            actual.extend(result)
            rows.extend(
                {
                    "kind": "candidate",
                    "state": state["id"],
                    **{k: v for k, v in p.items() if k != "root"},
                }
                for p in result
            )
        terminal = []
        for slot, fg in enumerate(baseline[mode]["ansi"]):
            # ANSI identities remain unchanged; disclose failure separately.
            ratios = [
                contrast(fg, hx(resolved(s["groups"], "Normal")["bg"])) for s in states
            ]
            terminal.append(
                {
                    "slot": slot,
                    "fg": fg,
                    "minimum": min(ratios),
                    "passes": min(ratios) >= 4.5,
                }
            )
        summary["polarity"][mode] = {
            "current_pairs": len(current),
            "current_failures": [p for p in current if p["ratio"] < 4.5],
            "candidate_states": 64,
            "candidate_pair_checks": len(actual),
            "candidate_minimum": min(p["ratio"] for p in actual),
            "candidate_failures": sum(p["ratio"] < 4.5 for p in actual),
            "fixed_foreground_repairs": repairs,
            "background_gamut_reductions": mapped,
            "terminal_fixed_ansi_on_dynamic_background": terminal,
        }
    (OUTPUT / "palettes.json").write_text(
        json.dumps(all_states, sort_keys=True, separators=(",", ":")) + "\n"
    )
    (OUTPUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    with (OUTPUT / "contrast.csv").open("w") as f:
        writer = csv.DictWriter(
            f,
            fieldnames=["kind", "state", "group", "context", "fg", "bg", "ratio"],
            lineterminator="\n",
        )
        writer.writeheader()
        writer.writerows(rows)
    locations = {
        "Tokyo_fixture": (35.68, 139.69),
        "Sydney_fixture": (-33.87, 151.21),
        "NorthPole_fixture": (90.0, 0.0),
        "SouthPole_fixture": (-90.0, 0.0),
    }
    with (OUTPUT / "solar.csv").open("w") as f:
        writer = csv.writer(f, lineterminator="\n")
        writer.writerow(
            ["fixture", "utc", "latitude", "longitude", "altitude", "phase", "state"]
        )
        for name, location in locations.items():
            for month, day in ((3, 20), (6, 21), (9, 23), (12, 21)):
                start = datetime(2026, month, day, tzinfo=timezone.utc)
                for step in range(48):
                    now = start + timedelta(minutes=30 * step)
                    value = select(now, location)
                    writer.writerow(
                        [
                            name,
                            now.isoformat(),
                            *location,
                            value["altitude"],
                            value["phase"],
                            value["index"],
                        ]
                    )
    print(
        json.dumps(
            {
                m: {
                    k: v
                    for k, v in s.items()
                    if k
                    in (
                        "candidate_minimum",
                        "candidate_pair_checks",
                        "candidate_failures",
                    )
                }
                for m, s in summary["polarity"].items()
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    generate()
