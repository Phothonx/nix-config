{ pkgs, ... }:
{
  home.packages = with pkgs.gnome; [
    nautilus # Filemanager
    sushi # Nautilus previewer
    pkgs.nautilus-open-any-terminal
  
    pkgs.evince # doc viewer
    pkgs.celluloid # MPV frontend
    pkgs.amberol # Audio player
    pkgs.loupe # Image viewe
  ];
}
