{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.neovim;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    programs.neovim = {
      defaultEditor = true;
      withPython3 = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins;
        [
          # lSP
          nvim-lspconfig

          # TS
          nvim-treesitter.withAllGrammars

          # MINI <3
          mini-nvim

	  # NEORG
	  plenary-nvim
	  nui-nvim
	  nvim-nio
	  neorg
        ];

      extraPackages = with pkgs; [
        gcc
        python3

        # LSP / FORMATTERS
        ccls
        lua-language-server
        ruff
        ocamlPackages.lsp
        nixd
        alejandra
      ];

      extraLuaPackages = luaPkgs : [
        luaPkgs.pathlib-nvim # For neorg
        luaPkgs.lua-utils-nvim # For neorg
      ];

      # https://nixalted.com/
      extraLuaConfig = with theme.palette; ''
        require("mini.base16").setup({
          palette = {
            base00 = "#${base00}",
            base01 = "#${base01}",
            base02 = "#${base02}",
            base03 = "#${base03}",
            base04 = "#${base04}",
            base05 = "#${base05}",
            base06 = "#${base06}",
            base07 = "#${base07}",
            base08 = "#${base08}",
            base09 = "#${base09}",
            base0A = "#${base0A}",
            base0B = "#${base0B}",
            base0C = "#${base0C}",
            base0D = "#${base0D}",
            base0E = "#${base0E}",
            base0F = "#${base0F}",
          },
          use_cterm = true,
        })
      '';
    };

    home.file.".config/nvim" = {
      recursive = true;
      source = ./nvim;
    };
  };
}
