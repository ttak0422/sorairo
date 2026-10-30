#!/bin/sh
set -eu
if [ "${SORAIRO_SOLAR_EXPERIMENT:-}" != 1 ]; then
  echo 'Opt in with SORAIRO_SOLAR_EXPERIMENT=1 to run isolated headless tests.' >&2
  exit 2
fi
cd "$(dirname "$0")"
export SORAIRO_SOLAR_ROOT="$PWD"
solar_temp_root="${TMPDIR:-/tmp}"
SORAIRO_SOLAR_OUTPUT="$(mktemp -d "${solar_temp_root%/}/sorairo-solar.XXXXXX")"
export SORAIRO_SOLAR_OUTPUT
trap 'printf "Artifacts: %s\n" "$SORAIRO_SOLAR_OUTPUT"' 0
export XDG_CONFIG_HOME="$SORAIRO_SOLAR_OUTPUT/xdg/config"
export XDG_DATA_HOME="$SORAIRO_SOLAR_OUTPUT/xdg/data"
export XDG_STATE_HOME="$SORAIRO_SOLAR_OUTPUT/xdg/state"
export XDG_CACHE_HOME="$SORAIRO_SOLAR_OUTPUT/xdg/cache"
export PYTHONDONTWRITEBYTECODE=1
nvim --headless -u NONE -i NONE -n -l export.lua
if ! python3 report.py > "$SORAIRO_SOLAR_OUTPUT/compiler.log" 2>&1; then
  cat "$SORAIRO_SOLAR_OUTPUT/compiler.log"
  exit 1
fi
if ! python3 -m unittest discover -s tests -v > "$SORAIRO_SOLAR_OUTPUT/python-tests.log" 2>&1; then
  cat "$SORAIRO_SOLAR_OUTPUT/python-tests.log"
  exit 1
fi
if ! nvim --headless -u NONE -i NONE -n -l tests/runtime.lua > "$SORAIRO_SOLAR_OUTPUT/nvim-tests.log" 2>&1; then
  cat "$SORAIRO_SOLAR_OUTPUT/nvim-tests.log"
  exit 1
fi
python3 - <<'PY'
import gzip
import os
from pathlib import Path
p=Path(os.environ['SORAIRO_SOLAR_OUTPUT'])/'contrast.csv'
with gzip.GzipFile(str(p)+'.gz',mode='wb',mtime=0) as f:
    f.write(p.read_bytes())
p.unlink()
PY
cat "$SORAIRO_SOLAR_OUTPUT/compiler.log" "$SORAIRO_SOLAR_OUTPUT/python-tests.log" "$SORAIRO_SOLAR_OUTPUT/nvim-tests.log"
printf '\n'
