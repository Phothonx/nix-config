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
    gnuplot
    wl-screenrec
    openvpn
    usbutils
    net-tools
    caligula
    usbutils

    # secu
    # vulnix
    # lynis
    veracrypt
    kryptor
    nmap
    netcat-gnu
    gobuster

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
