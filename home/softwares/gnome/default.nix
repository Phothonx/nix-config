{ pkgs, ... }:
{
  home.packages = with pkgs.gnome; [
    nautilus # Filemanager
    sushi # Nautilus previewer
    pkgs.nautilus-open-any-terminal

    gnome-clocks
    gnome-characters
    gnome-calculator
    gnome-calendar
    pkgs.celluloid # MPV frontend
    pkgs.amberol # Audio player
    pkgs.loupe # Image viewe
  ];
}