{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.greetd;

  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";

  tuigreet = "${getExe pkgs.greetd.tuigreet} --time --remember-session --sessions ${hyprland-session}";
in {
  config = mkIf cfg.enable {
    services.greetd = {
      settings = {
        default_session = {
          command = tuigreet;
          user = "greeter";
        };
      };
    };
  };
}
