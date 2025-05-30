{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wayland
    ./softwares
    ./games
    ./services
    ./dev
    ./config
    ./cli
  ];

  # QUICK INTALL
  home.packages = with pkgs; [];

  home = {
    username = "nico";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
