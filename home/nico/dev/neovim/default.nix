{ pkgs,config, ...}: {
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

      # lSP
      nvim-lspconfig
      nvim-treesitter.withAllGrammars

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
      vscode-langservers-extracted
      marksman
      nodePackages.yaml-language-server
      stylua
      shfmt
      ccls
      lua-language-server
      basedpyright
      ruff
      ocamlPackages.ocaml-lsp
      ocamlPackages.ocamlformat
      nixd
      alejandra
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
        rocks = { enabled = false },
        pkg = { enabled = false },
        install = { missing = false },
        change_detection = { enabled = false },
        checker = { enabled = false },
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
