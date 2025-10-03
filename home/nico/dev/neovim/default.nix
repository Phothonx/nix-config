{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    withPython3 = true;
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
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
        pkgs.tree-sitter.allGrammars
        ++ [
          p.latex
          p.tree-sitter-norg
          p.tree-sitter-norg-meta
        ]))

      # DEPS
      image-nvim # neorg & molten
      nui-nvim # neorg
      plenary-nvim # neorg
      nvim-nio # neorg
      # pkgs.tree-sitter-grammars.tree-sitter-norg-meta
      # pkgs.tree-sitter-grammars.tree-sitter-norg
      nvim-web-devicons

      # MINI & SNACKS <3
      mini-nvim
      snacks-nvim

      # OTHER
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
      cmake
      git
      curl
      fzf
      python3
      imagemagick
      sqlite # snacks
      texliveMedium # vimtex
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

        ipykernel
      ];

    extraLuaConfig = ''
      -- Make sure to setup `mapleader` and `maplocalleader` before
      -- loading lazy.nvim so that mappings are correct.
      -- This is also a good place to setup other settings (vim.opt)
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"

      require("config.options")

      -- Setup lazy.nvim
      require("lazy").setup({
        spec = {
          -- import your plugins
          { import = "plugins" },
        },
        dev = {
          path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
          patterns = {""}, -- Specify that all of our plugins will use the dev dir. Empty string is a wildcard!
        },
        performance = {
          reset_packpath = false,
          rtp = {
            reset = false,
            -- disable some rtp plugins
            disabled_plugins = {
              "gzip",
              -- "matchit",
              -- "matchparen",
              -- "netrwPlugin",
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
        ui = {
          border = "single",
        },
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
