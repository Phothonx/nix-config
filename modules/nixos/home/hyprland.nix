{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.home-manager.users.${config.user.name}.wayland.windowManager.hyprland;
in {
  config = mkIf cfg.enable {
    # Without this, you may have issues with XDG Portals, or missing session files in your Display Manager
    programs.hyprland.enable = true;
  };
}
