{
  description = "colorscheme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";

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
          pkgs,
          lib,
          ...
        }:
        let
          vim =
            # for build
            pkgs.vim_configurable.customize {
              vimrcConfig.packages.myVimPackage = {
                start = [
                  (pkgs.vimUtils.buildVimPlugin {
                    pname = "pgmnt-vim";
                    version = inputs.pgmnt-vim.rev or "latest";
                    src = inputs.pgmnt-vim;
                  })
                ];
              };
            };
        in
        {
          packages.sorairo-vim = pkgs.vimUtils.buildVimPlugin {
            name = "sorairo-vim";
            src = lib.cleanSource ./.;
          };

          apps.default =
            let
              vim = pkgs.vim_configurable.customize {
                vimrcConfig = {
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
            in
            {
              type = "app";
              program = "${vim}/bin/vim";
            };

          devShells.default = pkgs.mkShell {
            packages = [
              vim
            ];
          };
        };
    });
}
