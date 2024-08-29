{ pkgs, lib, ... }:
with pkgs; with lib; 
let
  lock = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 1 && ${systemd}/bin/loginctl lock-session && sleep 1";

  suspend = "${systemd}/bin/loginctl suspend";

  suspendScript = writeShellScript "suspend-script" ''
    ${pipewire}/bin/pw-cli i all 2>&1 | ${ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${suspend}
    fi
  '';
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = lock;
        lock_cmd = getExe hyprlock;
        unlock_cmd = "pkill -USR1 hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 600;
          on-timeout = "dunstify -u 0 \"Hypridle\" \"You're idling since 10min !\" && brightnessctl set --min-value=4800 50% && brightnessctl -sd platform::kbd_backlight set 0";
          on-resume = "brightnessctl set --min-value=4800 90% && brightnessctl -sd platform::kbd_backlight set 1";
        }
        {
          timeout = 660;
          on-timeout = lock;
        }
        {
          timeout = 720;
          on-timeout = getExe suspendScript;
        }
      ];
    };
  };
}
