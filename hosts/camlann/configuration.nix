{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
  ];
}
