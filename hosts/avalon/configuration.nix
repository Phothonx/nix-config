{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
    common-pc-ssd
    common-cpu-intel
    ./../common/global # default.nix import all
    ./../common/optional # default.nix import all
    ./../common/users/nico
  ];

  services.logind = {
    powerKey = "suspend";
    powerKeyLongPress = "hibernate";
  };

  programs.dconf.enable = true; # gnome
  programs.xfconf.enable = true; # xfce

  # thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
