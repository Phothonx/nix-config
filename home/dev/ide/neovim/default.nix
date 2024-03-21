{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ 
  neovim

  gdb

  yarn
  nodejs

  quarto
  vimPlugins.sniprun

  # LSP
  pkgs.ocamlPackages.ocaml-lsp
  lua-language-server
  ccls
  nodePackages_latest.pyright
  ];

  # xdg.configFile."nvim/" = {
  #   recursive = true;
  #   source = ./config;
  # };
}
