{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      # CLI Tools
      imagemagick
      yt-dlp
      cfspeedtest
      duf
      zip
      unzip
      unrar
      glow

      # Quality of life
      thefuck
      ripgrep
      fzf
      ranger
      fd
      catimg
      rsync

      # Fun fetching
      cowsay
      pipes
      cbonsai
      lolcat
      nitch
    ];

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };

    bat = {
      enable = true;
      config = {
        theme = "base16";
        pager = "less -FR";
      };
    };
  };
}
