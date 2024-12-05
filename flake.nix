{
  description = "colorscheme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    pgmnt-vim = {
      url = "github:cocopon/pgmnt.vim";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (_: {
      systems = import inputs.systems;
      perSystem =
        {
          self',
          system,
          pkgs,
          lib,
          ...
        }:
        {
          packages.sorairo-vim = pkgs.vimUtils.buildVimPlugin {
            name = "sorairo-vim";
            src = lib.cleanSource ./.;
          };
          checks = {
            pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                nixfmt-rfc-style.enable = true;
                statix.enable = true;
                deadnix.enable = true;
                luacheck.enable = true;
                stylua.enable = true;
                vint = {
                  enable = true;
                  name = "vint";
                  entry = "${pkgs.vim-vint}/bin/vint";
                  files = "\\.vim$";
                  excludes = [ "colors/sorairo\\.vim" ];
                };
              };
            };
          };
          apps =
            let
              mkVimApp = cfg: {
                type = "app";
                program = "${pkgs.vim_configurable.customize { vimrcConfig = cfg; }}/bin/vim";
              };
            in
            {
              vim-for-build = mkVimApp {
                packages.myVimPackage = {
                  start = [
                    (pkgs.vimUtils.buildVimPlugin {
                      pname = "pgmnt-vim";
                      version = inputs.pgmnt-vim.rev or "latest";
                      src = inputs.pgmnt-vim;
                    })
                  ];
                };
              };
              test-vim = mkVimApp {
                customRC = ''
                  set termguicolors
                  set background=light
                  syntax on
                  colorscheme sorairo
                '';
                packages.myVimPackage = {
                  start = [
                    self'.packages.sorairo-vim
                  ];
                };
              };
            };

          devShells.default = pkgs.mkShell {
            inherit (self'.checks.pre-commit-check) shellHook;
            packages = [ ];
          };
        };
    });
}
