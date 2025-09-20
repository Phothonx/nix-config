{pkgs, ...}: {
  home.packages = with pkgs; [
    # Video mpv frontend
    celluloid

    # Image viewer
    loupe
    imv

    # Audio
    pwvucontrol
    helvum

    bitwarden
    obs-studio
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
