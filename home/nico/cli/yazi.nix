{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    wl-clipboard
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = {
      # manager = {
      #   sort_by = "mtime";
      #   sort_dir_first = true;
      #   linemode = "size_and_mtime";
      # };
    };
  };
}
