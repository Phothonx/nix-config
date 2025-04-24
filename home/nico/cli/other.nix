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
    wev
    just
    yt-dlp
    bc
    libnotify
    btop
    lazygit
    lz4

    # secu
    # vulnix
    # lynis
    veracrypt
    kryptor

    # Quality of life
    catimg
    rsync
    bat
    ripgrep
    fzf
    fd

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
