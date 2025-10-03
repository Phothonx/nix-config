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
    settings.Login = {
      HandlePowerKey = "suspend";
    };
  };

  # to detect mouse keybr at startup
  boot.initrd.availableKernelModules = ["hid_cherry"];

  programs.xfconf.enable = true; # xfce

  # thunar https://nixos.wiki/wiki/Thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # https://wiki.archlinux.org/title/File_manager_functionality#Thumbnail_previews
  environment.systemPackages = with pkgs; [
    poppler_gi
    webp-pixbuf-loader
    nufraw-thumbnailer
    ffmpegthumbnailer
    libgsf

    # games
    gvfs
  ];

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
