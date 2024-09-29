{ config, pkgs, lib, ... }:
with pkgs; 
with lib;
let
  cfg = config.services.hypridle;

  wpctl = getExe' wireplumber "wpctl";
  hylock = getExe' hyprlock "hyprlock";
  hyctl = getExe' hyprland "hyprctl";
  brctl = getExe' brightnessctl "brightnessctl";
  pwcli = getExe' pipewire "pw-cli";
  rg = getExe' ripgrep "rg";

  lock = "${getExe' systemd "loginctl"} lock-session";
  suspend = "${getExe' systemd "systemctl"} suspend";

  suspendScript = writeShellScript "suspend-script" ''
    ${pwcli} i all 2>&1 | ${rg} running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${suspend}
    fi
  '';
in
{
  config = mkIf cfg.enable {
    # Hyprlock don't have the time to fully laod
    # https://github.com/hyprwm/hypridle/issues/49
    # https://github.com/hyprwm/hyprlock/issues/184
    services.hypridle = {
      settings = {
        general = {
          before_sleep_cmd = "${lock} && ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 1 && ${brctl} -d platform::kbd_backlight set 0";
          after_sleep_cmd = "${hyctl} dispatch dpms on && ${brctl} -d platform::kbd_backlight set 1 && ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ 0";
          lock_cmd = "pidof hyprlock || ${hylock}";
          unlock_cmd = "pkill -USR1 hyprlock";
        };
        listener = [
          {
            timeout = 120;
            on-timeout = "${brctl} -s --min-value=4800 set 50%- && ${brctl} -d platform::kbd_backlight set 0";
            on-resume = "${brctl} -r --min-value=4800 && ${brctl} -d platform::kbd_backlight set 1";
          }
          {
            timeout = 150;
            on-timeout = lock;
          }
          {
            timeout = 180;
            on-timeout = getExe' suspendScript "suspend-script";
          }
        ];
      };
    };
  };
}
