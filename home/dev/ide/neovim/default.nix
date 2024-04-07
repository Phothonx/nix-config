{ inputs, pkgs, config, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./plugins.nix
    ./mapping.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    globals.mapleader = " ";
  };
}
