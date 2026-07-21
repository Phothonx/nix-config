{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      evemu
      vlc
      loupe
      imv
      audacity
      # bitwarden-desktop
      spotify
      localsend
      teamspeak6-client
      ungoogled-chromium
      vesktop
      wl-clipboard
      via
      libreoffice
      # freecad
      # mission-planner
      # kdePackages.kdenlive
      # phoronix-test-suite
      # blender
    ];

    persist.user.directories = [
      ".config/chromium"
      ".config/Bitwarden"
      ".config/spotify"
      ".config/vesktop"
      ".config/localsend"
    ];
  };
}
