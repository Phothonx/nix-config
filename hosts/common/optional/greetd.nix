{
  pkgs,
  lib,
  ...
}: let
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";

  tuigreet = "${lib.getExe pkgs.greetd.tuigreet} --time --remember-session --sessions ${hyprland-session}";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = tuigreet;
        user = "greeter";
      };
    };
  };
}
