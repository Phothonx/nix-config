{pkgs, ...}:
let
  system = pkgs.system;

  pkgs-old = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/882842d2a908700540d206baa79efb922ac1c33d.tar.gz";
    sha256 = "105v2h9gpaxq6b5035xb10ykw9i3b3k1rwfq4s6inblphiz5yw7q";
  }) { inherit system; };
in
{
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
    package = pkgs-old.gamescope;
    enable = true;
  };
}
