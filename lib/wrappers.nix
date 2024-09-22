{ lib, pkgs, ... }:
with lib;
{
  wrapNoPad = package:
  let
    # https://ryantm.github.io/nixpkgs/builders/trivial-builders/#trivial-builder-writeShellApplication
    noPad = pkgs.writeShellApplication {
      name = package.pname;
      runtimeInputs = [ pkgs.ripgrep ];
      text = ''
        if echo "$TERM" | rg kitty -q
        then
          kitty @ set-spacing padding=0
          ${getExe package} "$@"
          kitty @ set-spacing padding=default
        else
          ${getExe package} "$@"
        fi
      '';
    };
  in
    # use symlinkjoin to propagate man pages ect...
    # https://nixos.wiki/wiki/Nix_Cookbook#Wrapping_packages
    pkgs.symlinkJoin {
      name = package.name;
      paths = [ noPad package ];
      # using package.name is wrong ?
      # wrapprogram can't be used in this case ?
    };
}
