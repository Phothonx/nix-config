{ pkgs, ... }:
{
  imports =
  [
    ./ide
  ];

  # home.packages = with pkgs; [
  #   gcc

  #   ocaml
  #   ocamlPackages.utop

  #   python311
  #   python311Packages.numpy
  #   python311Packages.matplotlib
  # ];

  nix.registry = {
    shells = {
      from = {
        id = "shells";
        type = "indirect";
      };
      to = {
        type = "path";
        path = builtins.toString ./flake;
      };
    };
  };
}
