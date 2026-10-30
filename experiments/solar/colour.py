"""Dependency-free Oklab conversion, using Ottosson's public-domain matrices.

https://bottosson.github.io/posts/oklab/ (2021-01-25 matrices)
CSS Color 4 sRGB transfer; fixed-L/h chroma reduction into sRGB.
This is a strict in-gamut reduction, not CSS Color 4 local-MINDE gamut mapping.
"""

import math


def rgb(hexvalue):
    return tuple(int(hexvalue[i : i + 2], 16) / 255 for i in (1, 3, 5))


def linear(c):
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def encoded(c):
    return 12.92 * c if c <= 0.0031308 else 1.055 * c ** (1 / 2.4) - 0.055


def lab(hexvalue):
    r, g, b = map(linear, rgb(hexvalue))
    l = (0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b) ** (1 / 3)
    m = (0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b) ** (1 / 3)
    s = (0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b) ** (1 / 3)
    return (
        0.2104542553 * l + 0.793617785 * m - 0.0040720468 * s,
        1.9779984951 * l - 2.428592205 * m + 0.4505937099 * s,
        0.0259040371 * l + 0.7827717662 * m - 0.808675766 * s,
    )


def linear_from_lab(value):
    L, a, b = value
    l = (L + 0.3963377774 * a + 0.2158037573 * b) ** 3
    m = (L - 0.1055613458 * a - 0.0638541728 * b) ** 3
    s = (L - 0.0894841775 * a - 1.291485548 * b) ** 3
    return (
        4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
        -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
        -0.0041960863 * l - 0.7034186147 * m + 1.707614701 * s,
    )


def gamut(value):
    return all(-1e-7 <= c <= 1 + 1e-7 for c in linear_from_lab(value))


def hex_lab(value):
    L, a, b = value
    if not all(math.isfinite(v) for v in value) or not 0 <= L <= 1:
        raise ValueError("invalid Oklab")
    mapped = False
    if not gamut(value):
        mapped = True
        lo, hi = 0.0, 1.0
        for _ in range(28):
            mid = (lo + hi) / 2
            if gamut((L, a * mid, b * mid)):
                lo = mid
            else:
                hi = mid
        value = (L, a * lo, b * lo)
    channels = linear_from_lab(value)
    assert gamut(value)
    # Clamp only floating point boundary noise, after explicit gamut mapping.
    result = "#" + "".join(
        f"{int(math.floor(max(0.0, min(1.0, encoded(c))) * 255 + 0.5)):02x}"
        for c in channels
    )
    return result, mapped


def luminance(hexvalue):
    r, g, b = map(linear, rgb(hexvalue))
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast(fg, bg):
    a, b = sorted((luminance(fg), luminance(bg)))
    return (b + 0.05) / (a + 0.05)


def ensure_contrast(fg, backgrounds, polarity, minimum=4.5):
    """Offline foreground lightness correction, fixed hue, inspect hex result.

    Choose the first passing quantized lightness moving toward black/white.
    Returned foreground is fixed across all 64 states, never repaired per tick.
    """
    if min(contrast(fg, bg) for bg in backgrounds) >= minimum:
        return fg
    L, a, b = lab(fg)
    endpoint = 0 if polarity == "light" else 1
    for i in range(1, 1001):
        candidate, _ = hex_lab((L + (endpoint - L) * i / 1000, a, b))
        if min(contrast(candidate, bg) for bg in backgrounds) >= minimum:
            return candidate
    raise ValueError(f"no fixed foreground for {fg} on {backgrounds}")
