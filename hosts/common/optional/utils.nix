{pkgs, ...}: {
  programs.xfconf.enable = true; # xfce

  # thunar https://nixos.wiki/wiki/Thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # https://wiki.archlinux.org/title/File_manager_functionality#Thumbnail_previews
  environment.systemPackages = with pkgs; [
    poppler_gi
    webp-pixbuf-loader
    # nufraw-thumbnailer package broken
    ffmpegthumbnailer
    libgsf

    # games
    gvfs
  ];
}
