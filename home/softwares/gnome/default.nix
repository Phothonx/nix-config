{ pkgs, ... }:
{
  home.packages = with pkgs.gnome; [
    nautilus # Filemanager
    sushi # Nautilus previewer
    pkgs.nautilus-open-any-terminal

    pkgs.celluloid # MPV frontend
    pkgs.amberol # Audio player
    pkgs.loupe # Image viewe
  ];
}
