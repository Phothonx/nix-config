{pkgs, ...}: {
  imports = [
    ./discord
    ./firefox
    ./utils
    ./spotify
    ./terminal
    ./games
    ./qutebrowser
  ];
}
