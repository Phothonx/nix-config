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
      vim-repeat

      # COLORSHEME
      catppuccin-nvim
    ]
    ++ map (p: { plugin = p; optional = true; }) [

      # UI  
      vim-startuptime
      neo-tree-nvim
      toggleterm-nvim
      lualine-nvim
      gitsigns-nvim
      which-key-nvim
      telescope-nvim
      iron-nvim

      # UTILS
      indent-blankline-nvim
      nvim-autopairs

      # SNIP
      luasnip

      # CMP
      nvim-cmp
      cmp_luasnip
      cmp-fuzzy-buffer
      cmp-fuzzy-path

      # DAP

      # NAV
      leap-nvim
      better-escape-nvim
      
      # LSP, FMT
      nvim-lspconfig
      conform-nvim
    ];

    extraPackages = with pkgs; [
      libgcc

      # LSP
      ccls
      lua-language-server
      pyright
      ocamlPackages.lsp
      nil
      marksman

      # REPLS 
      ocamlPackages.utop
      python3
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"

      -- PLUGINS --
      require("lz.n").load("plugins")

      -- CONFIG --
      require("config.mappings")
      require("config.options")

      -- COLORSHEME --
      require("config.catppuccin")
      vim.cmd.colorscheme "catppuccin"
    '';
  };

  home.file."lua" = {
    recursive = true;
    source = ./lua;
    target = ".config/nvim/lua";
  };
}
