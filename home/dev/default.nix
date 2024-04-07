{ pkgs, ... }:
{
  imports =
  [
    ./ide
  ];

  home.packages = with pkgs; [
    gcc

    ocaml
    ocamlPackages.utop

    python311
    python311Packages.numpy
    python311Packages.matplotlib
  ];

  # nix.registry = {
  #   shells.to = {
  #     type = "path";
  #     path = builtins.toString ./shells;
  #   };
  # };
}
