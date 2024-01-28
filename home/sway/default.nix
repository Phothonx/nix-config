{ pkgs, inputs, ... }:
{
  imports =
  [
    ./swaync.nix
    ./swaylock.nix
  ];
}