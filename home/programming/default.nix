{ pkgs, ... }:
{
  home.packages = with pkgs; [  
    gcc
    python3
  ];

  programs.opam = {
    enable = true;
  };
}