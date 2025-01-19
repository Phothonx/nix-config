{
  inputs,
  ...
}:
{
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
    common-pc-ssd
    common-cpu-intel
    ./../common/global
    ./../common/optional/all.nix
    ./../common/users/nico
  ];

  services.logind = {
    powerKey = "suspend";
    powerKeyLongPress = "hibernate";
  };

  programs.dconf.enable = true; # gnome

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
