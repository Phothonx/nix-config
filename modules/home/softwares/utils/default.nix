{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.desktopApps;
in {
  options.desktopApps = {
    enable = mkEnableOption "Enable desktop apps like filemanager, doc viewer...";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Filemanager
      nautilus
      nautilus-python
      nautilus-open-any-terminal
      sushi # Nautilus previewer

      # Doc viewer
      evince

      # Video mpv frontend
      celluloid

      # Audio player
      amberol

      # Image viewer
      loupe

      # Audio
      pwvucontrol
      helvum

      bitwarden
    ];
  };
}
