{ inputs, pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lz-n
      nvim-tree-lua
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"

      -- PLUGINS --
      require("lz.n").load("plugins")

      -- OPTIONS --
      require("config.options")
      
      -- MAPPING --
      require("config.mappings")
    '';
  };

  home.file."lua" = {
    recursive = true;
    source = ./lua;
    target = ".config/nvim/lua";
  };
}
