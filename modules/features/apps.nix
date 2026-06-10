{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      evemu
      vlc
      loupe
      imv
      bitwarden-desktop
      spotify
      localsend
      teamspeak6-client
      ungoogled-chromium
      vesktop
      wl-clipboard
      via
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
