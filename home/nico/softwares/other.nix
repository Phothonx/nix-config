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
    imv

    # Audio
    # pwvucontrol
    helvum

    #bitwarden
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
