{pkgs, ...}: let
  system = pkgs.system;

  pkgs-old = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/4684fd6b0c01e4b7d99027a34c93c2e09ecafee2.tar.gz";
    sha256 = "1ajjga131kjxiw2760pjjsxpa201gzp0i6gphgg44vq496lqpcyb";
  }) {inherit system;};
in {
  programs.gamemode = {
    enable = true;
    settings = {
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };

  programs.gamescope = {
    # package = pkgs-old.gamescope;
    enable = true;
  };
}
