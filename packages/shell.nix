{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.shell = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;

      package = self'.packages.fish;
      runtimePkgs = with pkgs; [
        self'.packages.neovim
        self'.packages.git

        claude-code

        # CLI Tools
        self'.packages.yazi
        jq
        lazysql
        ffmpeg-full
        visidata
        zoxide
        fd
        eza
        killall
        wget
        file
        imagemagick
        cfspeedtest
        duf
        dust
        zip
        unzip
        p7zip
        unp
        tree
        # unrar
        wev
        just
        yt-dlp
        bc
        libnotify
        htop
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

        # Secu
        # vulnix
        # lynis
        # veracrypt
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

      env = {
        EDITOR = lib.getExe self'.packages.neovim;
        VISUAL = lib.getExe self'.packages.neovim;
        PAGER = "less";
        FZF_DEFAULT_COMMAND = "fd --type f";
        LESS = "-FRX";
      };
    };
  };
}
