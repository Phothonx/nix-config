{
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # COLORSHEMES
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

      # Other
      flash-nvim
      which-key-nvim
      nvim-web-devicons
    ];

    extraPackages = with pkgs; [
      gcc
      cmake
      git
      curl
      fzf
      python3
      imagemagick

      # LSP / FORMATTERS
      ccls
      clang-tools
      lua-language-server
      pyright
      ruff
      ocamlPackages.lsp
      ocamlPackages.ocamlformat
      nixd

      # REPL
      ocamlPackages.utop
    ];

    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        pathlib-nvim # For neorg
        lua-utils-nvim # For neorg
      ];
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = ./nvim;
  };
}
