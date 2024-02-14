{ pkgs, ... }:
{
  home.packages = with pkgs; [  
    gcc
    python3

    ocaml
    ocamlPackages.utop
  ];
}