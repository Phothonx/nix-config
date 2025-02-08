{pkgs, ...}: {
  home.packages = with pkgs; [
    # Filemanager
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    sushi # Nautilus previewer

    # Doc viewer
    evince

    # Video mpv frontend
    celluloid

    # Audio player
    amberol

    # Image viewer
    loupe

    # Audio
    pwvucontrol
    helvum

    #bitwarden
  ];
}
