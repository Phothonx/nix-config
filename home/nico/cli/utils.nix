{pkgs, ...}: {
  home.packages = with pkgs; [
    # CLI Tools
    imagemagick
    cfspeedtest
    duf
    zip
    unzip
    unp
    tree
    unrar
    glow
    wev
    # bitwarden-cli
    just
    yt-dlp
    bc
    libnotify
    btop
    lazygit

    # secu
    # vulnix
    # lynis
    veracrypt

    # Quality of life
    catimg
    rsync
    bat
    ripgrep
    fzf
    yazi
    fd
    atuin

    # Fun/fetching
    cowsay
    tt
    pipes
    cbonsai
    cmatrix
    lolcat
    nitch
    colorpanes
  ];
}
