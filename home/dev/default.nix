{ pkgs, ... }:
{
  imports =
  [
    ./ide
  ];
  
  home.packages = with pkgs; [  
    gcc
    python3

    opam
    ocaml
    ocamlPackages.utop
  ];
}
