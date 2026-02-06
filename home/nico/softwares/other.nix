{pkgs, ...}: {
  home.packages = with pkgs; [
    # kdePackages.kdenlive
    evemu

    # Video mpv frontend
    celluloid
    vlc

    # Image viewer
    loupe
    imv

    bitwarden-desktop
    spotify
    discord
    chromium
    localsend
  ];

  programs.zathura = {
    enable = true;
    extraConfig = "
set synctex true
set highlight-color rgba(0,188,0,0)
set highlight-active-color rgba(0,188,0,0)
    ";
  };
}
