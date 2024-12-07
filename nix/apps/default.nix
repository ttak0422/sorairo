{
  inputs,
  self',
  pkgs,
  ...
}:

let
  mkVimApp = cfg: {
    type = "app";
    program = "${pkgs.vim-full.customize { vimrcConfig = cfg; }}/bin/vim";
  };
  mkNeovimApp = cfg: {
    type = "app";
    program = "${
      with pkgs; wrapNeovimUnstable neovim-unwrapped (neovimUtils.makeNeovimConfig cfg)
    }/bin/nvim";
  };
  readLua = path: ''
    lua << EOF
    ${builtins.readFile path}
    EOF
  '';
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
  test-nvim = mkNeovimApp {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = self'.packages.sorairo-vim;
        config = "colorscheme sorairo";
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = readLua ./nvim/treesitter.lua;
      }
    ];
  };
}
