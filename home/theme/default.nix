{ pkgs, lib, ... }:
{
  imports = [./theme.nix];

  options.artwork = lib.mkOption {
    type = lib.types.attrs; 
  };
}
