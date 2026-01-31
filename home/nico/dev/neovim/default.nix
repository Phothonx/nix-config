{
  pkgs,
  config,
  ...
}: let
  mark2html = pkgs.writeShellApplication {
    name = "mark2html";
    runtimeInputs = [pkgs.pandoc];
    text = builtins.readFile ./mark2html.sh;
  };
in {
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
      catppuccin-nvim

      # lSP / TS
      (
        pkgs.vimPlugins.nvim-treesitter.withPlugins (
          _:
            pkgs.vimPlugins.nvim-treesitter.allGrammars
        )
      )

      # DEPS
      nvim-web-devicons

      # MINI & SNACKS <3
      mini-nvim
      snacks-nvim

      # OTHER
      vimwiki
      friendly-snippets
      luasnip
      iron-nvim
      vimtex
      blink-cmp
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

      mark2html # vimwiki

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
      asm-lsp
      typescript-language-server
    ];

    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        pathlib-nvim
        lua-utils-nvim
        luarocks
      ];

    # extraPython3Packages = ps:
    #   with ps; [
    #   ];

    initLua = ''
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
        defaults = { lazy = false, },
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
