{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.kdenlive
    evemu

    # Video mpv frontend
    celluloid
    vlc

    # Image viewer
    loupe
    imv

    # Audio
    pwvucontrol
    coppwr

    bitwarden-desktop
    spotify
    discord
    chromium
  ];

  programs.zathura = {
    enable = true;
    extraConfig = "
set synctex-editor-command \"nvim --headless -c \"VimtexInverseSearch %l:%c '%f'\"\"
set synctex true
set highlight-color rgba(0,188,0,0)
set highlight-active-color rgba(0,188,0,0)
    ";
  };
}
