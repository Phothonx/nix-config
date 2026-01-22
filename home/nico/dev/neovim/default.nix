{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    withNodeJs = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim

      # COLORSHEMES
      # rose-pine
      # oxocarbon-nvim
      # tokyonight-nvim
      catppuccin-nvim

      # UI
      # nvchad-ui
      # base46

      # lSP / TS
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (_:
        pkgs.vimPlugins.nvim-treesitter.allGrammars
        ++ [
          pkgs.tree-sitter-grammars.tree-sitter-norg
          pkgs.tree-sitter-grammars.tree-sitter-norg-meta
        ])
      )

      # DEPS
      nui-nvim # neorg
      plenary-nvim # neorg
      nvim-nio # neorg
      nvim-web-devicons

      # MINI & SNACKS <3
      mini-nvim
      snacks-nvim

      # OTHER
      friendly-snippets
      iron-nvim
      vimtex
      blink-cmp
      molten-nvim
      neorg
      flash-nvim
      which-key-nvim
      Coqtail
    ];

    extraPackages = with pkgs; [
      gcc
      tree-sitter
      cmake
      git
      curl
      fzf
      python3
      imagemagick
      sqlite # snacks
      mermaid-cli # snacks image
      ghostscript
      trashy

      texliveMedium # vimtex
      biber
      pstree
      xdotool # vimtex

      # LSP / FORMATTERS
      vscode-langservers-extracted
      marksman
      nodePackages.yaml-language-server
      stylua
      shfmt
      ccls
      lua-language-server
      basedpyright
      ruff
      texlab
      ocamlPackages.ocaml-lsp
      ocamlPackages.ocamlformat
      nixd
      alejandra
    ];

    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        pathlib-nvim # For neorg
        lua-utils-nvim # For neorg
        magick # for image rendering molten
        luarocks # for neorg
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
        pillow
        requests
        kaleido

        ipykernel
      ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"

      require("config.options")

      vim.opt.runtimepath:append("${config.programs.neovim.package}/lib/nvim/parser")

      require("lazy").setup({
        read_only = true,
        spec = { { import = "plugins" }, },
        performance = {
          reset_packpath = false,
          rtp = {
            reset = false,
            disabled_plugins = {
              "gzip",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
        rocks = { enabled = false },
        pkg = { enabled = false },
        install = { missing = false },
        change_detection = { enabled = false },
        checker = { enabled = false },
        ui = { border = "single", },
      })

      require("config.lsp")
      require("config.keymaps")
    '';
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = ./nvim;
  };
}
