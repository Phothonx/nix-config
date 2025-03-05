{pkgs, ...}: {
  home.packages = with pkgs; [
    # Filemanager
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    sushi # Nautilus previewer

    # Doc viewer
    evince
    zathura

    # Video mpv frontend
    celluloid

    # Audio player
    amberol

    # Image viewer
    loupe
    imv

    # Audio
    pwvucontrol
    helvum

    #bitwarden
  ];
}
