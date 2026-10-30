"""Offline finite palette compiler and explicit pair inventory.

Only neutral surfaces move in Oklab. Syntax/diagnostic/git foregrounds are
corrected once against every state, then fixed throughout the day. Original
style flags, links, diff hues, and underline colours retain their roles.
"""

import copy
from colour import lab, hex_lab, contrast, ensure_contrast

EXCLUDED = {"EndOfBuffer", "Cursor", "lCursor", "CursorIM", "TermCursor"}
OVERLAYS = ("Normal", "CursorLine", "Visual", "NormalFloat")


def hx(value):
    return f"#{value:06x}"


def root(groups, name):
    seen = set()
    while "link" in groups.get(name, {}):
        if name in seen:
            raise ValueError("highlight cycle")
        seen.add(name)
        name = groups[name]["link"]
    return name


def resolved(groups, name):
    return groups.get(root(groups, name), {})


def pairs(groups):
    """Every authored text FG; own BG or Normal, plus overlay contexts.

    Background-only overlays inherit Normal FG. Not an exhaustive account of
    arbitrary plugin extmark layering or window-local highlight namespaces.
    """
    out = []
    normal = resolved(groups, "Normal")
    for name in sorted(groups):
        if name in EXCLUDED:
            continue
        attrs = resolved(groups, name)
        if attrs.get("reverse"):
            continue
        if "fg" in attrs:
            contexts = [name] if "bg" in attrs else OVERLAYS
            for context in contexts:
                bg = resolved(groups, context).get("bg", normal["bg"])
                out.append(
                    {
                        "group": name,
                        "context": context,
                        "root": root(groups, name),
                        "fg": hx(attrs["fg"]),
                        "bg": hx(bg),
                        "ratio": contrast(hx(attrs["fg"]), hx(bg)),
                    }
                )
    for context in ("CursorLine", "Visual"):
        bg = resolved(groups, context)["bg"]
        out.append(
            {
                "group": "Normal",
                "context": context,
                "root": "Normal",
                "fg": hx(normal["fg"]),
                "bg": hx(bg),
                "ratio": contrast(hx(normal["fg"]), hx(bg)),
            }
        )
    return out


def compile_states(baseline, mode):
    original = baseline[mode]["groups"]
    base_normal = resolved(original, "Normal")["bg"]
    # Hand-selected experimental endpoints, not user preferences.
    night, day = ("#e9e3d9", "#fdfdff") if mode == "light" else ("#171b27", "#222b40")
    low, high = lab(night), lab(day)
    original_lab = lab(hx(base_normal))
    neutral = {resolved(original, n)["bg"] for n in ("Normal", "NormalFloat", "Visual")}
    states = []
    mapped = 0
    for i in range(64):
        groups = copy.deepcopy(original)
        target = tuple(a + (b - a) * i / 63 for a, b in zip(low, high))
        for attrs in groups.values():
            if attrs.get("bg") in neutral:
                value = lab(hx(attrs["bg"]))
                moved = tuple(v + t - o for v, t, o in zip(value, target, original_lab))
                colour, was_mapped = hex_lab(moved)
                attrs["bg"] = int(colour[1:], 16)
                mapped += was_mapped
        states.append({"id": f"{mode}:{i:02d}", "groups": groups})
    backgrounds = {}
    for state in states:
        for pair in pairs(state["groups"]):
            backgrounds.setdefault(pair["root"], set()).add(pair["bg"])
    repairs = []
    fixed = {}
    for name, bgs in sorted(backgrounds.items()):
        old = hx(original[name]["fg"])
        # Some filled badges use the opposite text polarity to Normal.
        direction = (
            "light"
            if sum(contrast("#000000", b) for b in bgs)
            > sum(contrast("#ffffff", b) for b in bgs)
            else "dark"
        )
        new = ensure_contrast(old, bgs, direction)
        fixed[name] = int(new[1:], 16)
        if old != new:
            repairs.append({"group": name, "before": old, "after": new})
    for state in states:
        for name, fg in fixed.items():
            attrs = state["groups"][name]
            if attrs.get("sp") == attrs.get("fg"):
                attrs["sp"] = fg
            attrs["fg"] = fg
        # Underline-only diagnostics share the fixed semantic error/warn hue.
        for severity in ("Error", "Warn", "Info", "Hint", "Ok"):
            a = state["groups"].get("DiagnosticUnderline" + severity, {})
            a["sp"] = state["groups"]["Diagnostic" + severity]["fg"]
        state["minimum"] = min(p["ratio"] for p in pairs(state["groups"]))
    return states, repairs, mapped
