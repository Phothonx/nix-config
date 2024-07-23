{ inputs, pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; 
    [
      # LAZY LOADER
      lz-n

      # TS
      nvim-treesitter.withAllGrammars

      # DEPS
      plenary-nvim
      nvim-web-devicons
      nui-nvim
      image-nvim

      # COLORSHEME
      catppuccin-nvim
    ]
    ++ map (p: { plugin = p; optional = true; }) [

      # UI  
      vim-startuptime
      neo-tree-nvim
      toggleterm-nvim
      # lualine-nvim
      gitsigns-nvim
      # trouble-nvim
      which-key-nvim
      telescope-nvim
      iron-nvim

      # INDENT
      # guess-indent-nvim
      indent-blankline-nvim
      # vim-illuminate

      # UTILS
      nvim-surround
      nvim-autopairs
      
      # LSP

      # CMP
      # DAP

      # NAV
      # vim-repeat
      leap-nvim
      # flit-nvim
      better-escape-nvim
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

      -- COLORSHEME --
      require("catppuccin")
      vim.cmd.colorscheme "catppuccin"
    '';
  };

  home.file."lua" = {
    recursive = true;
    source = ./lua;
    target = ".config/nvim/lua";
  };
}
