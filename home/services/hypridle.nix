{ pkgs, lib, ... }:
# let
#   suspendScript = pkgs.writeShellScript "suspend-script" ''
#     ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
#     # only suspend if audio isn't running
#     if [ $? == 1 ]; then
#       ${pkgs.systemd}/bin/systemctl suspend
#     fi
#   '';
# in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = with pkgs; with lib; {
        ignore_dbus_inhibit = true;
        before_sleep_cmd = "loginctl lock-session";
        lock_cmd = "pidof ${getExe hyprlock} or ${getExe hyprlock}";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 20;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 25;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
