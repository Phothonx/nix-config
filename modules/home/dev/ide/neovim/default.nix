{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.neovim;
in {
  config = mkIf cfg.enable {
    programs.neovim = {
      defaultEditor = true;
      withPython3 = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins;
        [
          # LAZY LOADER
          lazy-nvim

          # TS
          nvim-treesitter.withAllGrammars

          # DEPS
          plenary-nvim
          nui-nvim
          nvim-web-devicons
          vim-repeat

          # COLORSHEME
          catppuccin-nvim

          # UI
          neo-tree-nvim
          telescope-nvim
          iron-nvim
          indent-blankline-nvim

          # CMP
          nvim-cmp
          luasnip
          cmp_luasnip
          cmp-nvim-lsp
          cmp-cmdline
          cmp-buffer
          cmp-path

          # NAV
          leap-nvim

          # LSP
          nvim-lspconfig
        ];

      extraPackages = with pkgs; [
        gcc
        python3

        # LSP
        ccls
        lua-language-server
        ruff-lsp
        ocamlPackages.lsp
        nixd
        alejandra
      ];

      extraLuaPackages = luaPkgs: with luaPkgs; [lua-utils-nvim nvim-nio pathlib-nvim];

      # https://nixalted.com/
      extraLuaConfig = ''
        vim.g.mapleader = " "
        vim.g.maplocalleader = "\\"

        -- LAZY-NVIM --
        require("lazy").setup({
          performance = {
            reset_packpath = false,
            rtp = {
              reset = false,
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
            }
          },

          spec = {
            -- Import plugins from lua/plugins
            { import = "plugins" },
          },

          dev = {
            path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
            patterns = {""}, -- Specify that all of our plugins will use the dev dir. Empty string is a wildcard! <- the one who wrote that is a liar XD
          },

          install = {
            -- Safeguard in case we forget to install a plugin with Nix
            missing = false,
          },
        })

        -- CONFIG --
        require("config.mappings")
        require("config.options")
      '';
    };

    home.file."lua" = {
      recursive = true;
      source = ./lua;
      target = ".config/nvim/lua";
    };
  };
}
