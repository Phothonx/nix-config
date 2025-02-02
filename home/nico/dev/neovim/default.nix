{
  pkgs,
  config,
  ...
}: let
  inherit (config) colorScheme;
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      rose-pine
      oxocarbon-nvim
      tokyonight-nvim
      catppuccin-nvim

      # lSP
      nvim-lspconfig

      # TS
      nvim-treesitter.withAllGrammars
      pkgs.tree-sitter-grammars.tree-sitter-norg-meta
      nvim-treesitter-parsers.norg

      # MINI & SNACKS <3
      mini-nvim
      snacks-nvim

      # CMP
      blink-cmp

      # REPL
      iron-nvim

      # NEORG
      plenary-nvim
      nui-nvim
      nvim-nio
      neorg
    ];

    extraPackages = with pkgs; [
      gcc
      cmake
      git
      curl
      fzf
      python3

      # LSP / FORMATTERS
      ccls
      clang-tools
      lua-language-server
      pyright
      ruff
      ocamlPackages.lsp
      ocamlPackages.ocamlformat
      nixd
      nil
      alejandra

      # REPL
      ocamlPackages.utop
    ];

    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        pathlib-nvim # For neorg
        lua-utils-nvim # For neorg
      ];

    extraLuaConfig = with colorScheme.base24; ''
      require("rose-pine").setup()
      require("tokyonight.colors").setup()
      require('catppuccin').setup()
      vim.cmd.colorscheme "catppuccin"
    '';
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = ./nvim;
  };
}
