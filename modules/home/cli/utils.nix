{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.cli;
in {
  options.cli = {
    tools.enable = mkEnableOption "Cli tools";
    qof.enable = mkEnableOption "QUality of life commands";
    fun.enable = mkEnableOption "Fun commands";
  };

  config = mkMerge [
    (mkIf cfg.tools.enable {
      home.packages = with pkgs; [
        # CLI Tools
        imagemagick
        cfspeedtest
        duf
        zip
        unzip
        unrar
        glow
        wev
        bitwarden-cli
        just
        yt-dlp
      ];
    })

    (mkIf cfg.qof.enable {
      home.packages = with pkgs; [
        # Quality of life
        catimg
        rsync
        bat
        ripgrep
        fzf
        yazi
        fd
        atuin
      ];
    })

    (mkIf cfg.fun.enable {
      home.packages = with pkgs; [
        # Fun fetching
        cowsay
        pipes
        cbonsai
        cmatrix
        lolcat
        nitch
      ];
    })
  ];
}
