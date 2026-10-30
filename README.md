<h1 align="center">sorairo</h1>
<div align="center">
  <p>color scheme for live coding on projector </p>
  <img alt="vim" src="https://img.shields.io/badge/Vim-019733.svg?&style=for-the-badge&logo=Vim&logoColor=white">
  <img alt="neovim" src="https://img.shields.io/badge/NeoVim-57A143.svg?&style=for-the-badge&logo=neovim&logoColor=white">
  <img alt="nix" src="https://img.shields.io/badge/nix-5277C3.svg?&style=for-the-badge&logo=NixOS&logoColor=white">
  <img alt="tag" src="https://img.shields.io/github/v/tag/ttak0422/sorairo?style=for-the-badge&label=latest%20tag&color=orange">
  <img alt="license" src="https://img.shields.io/github/license/ttak0422/sorairo?style=for-the-badge">

</div>

![image](https://github.com/user-attachments/assets/c1b602d1-0c25-479d-b99e-696c688209b1)

> [!CAUTION]
>  Please note that this is currently in an experimental phase. Destructive changes may be apply.

## Usage

```vim
set termguicolors
colorscheme sorairo
```

For dark mode, set `background` before loading the colorscheme.

```vim
set termguicolors
set background=dark
colorscheme sorairo
```

Use `:SorairoPreview` to open a scratch buffer that previews representative highlight groups.

## Offline solar palette experiment

To inspect a developer prototype that selects colors from seasonal solar
altitude, explicitly opt in from a checkout:

```sh
SORAIRO_SOLAR_EXPERIMENT=1 sh experiments/solar/run.sh
```

Requires Neovim 0.12.6 and Python 3.9+ with zoneinfo/tzdata. It reads the current
colorscheme, generates 64 candidate states for each polarity, and runs serial
contrast and isolated headless adapter checks. The final `Artifacts:` path
contains original failures, all text-pair results, fixtures and test logs.
Normal colorscheme loading stays static; this does not install a live scheduler.

Thirty minutes is a reevaluation interval, not a random color cycle. All test
times and locations are explicit fixtures. No location discovery, OS permission,
appearance control, live editor connection, or network request is used.

The text-pair target is 4.5:1 after hex rounding, not a guarantee of comfort.
Fixed ANSI colors are separate: 14 of 16 original light ANSI colors still miss
that target on the candidate backgrounds. meian's post-apply notification also
cannot provide the required pre-apply arbitration. Terminal behavior, plugin
cache integration and visual approval remain separate work.

See [the experiment help](doc/sorairo-solar.txt) (`:help sorairo-solar-run` after
help tags are generated) for operations, measurement scope and limitations.
