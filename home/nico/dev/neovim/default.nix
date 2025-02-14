{pkgs, ...}: {
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
      nvim-treesitter.withAllGrammars
      pkgs.tree-sitter-grammars.tree-sitter-norg-meta
      nvim-treesitter-parsers.norg

      # DEPS
      image-nvim # neorg & molten
      nui-nvim # neorg
      plenary-nvim # neorg
      nvim-nio # neorg
      nvim-web-devicons

      # MINI & SNACKS <3
      mini-nvim
      snacks-nvim

      # OTHER
      blink-cmp
      iron-nvim
      molten-nvim
      neorg
      flash-nvim
      which-key-nvim
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
      vscode-langservers-extracted

      # REPL
      ocamlPackages.utop
    ];

    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        pathlib-nvim # For neorg
        lua-utils-nvim # For neorg
        magick # for image rendering
      ];

    extraPython3Packages = ps:
      with ps; [
        # MOLTEN
        pynvim
        jupyter-client
        cairosvg # for image rendering
        pnglatex # for image rendering
        plotly # for image rendering
        pyperclip
        nbformat

        # test molten
        ipython
        jupyter
        ipykernel
        numpy
        matplotlib
        scipy
      ];
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = ./nvim;
  };
}
