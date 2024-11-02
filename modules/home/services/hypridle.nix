{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.services.hypridle;

  inherit (lib) mkIf;
  inherit (pkgs) writeShellScript;

  brightnessDownScript = writeShellScript "brightness-down-script" ''
    ${pkgs.brightnessctl}/bin/brightnessctl --save --min-value=4800 set 50%-
    ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --save set 0
  '';

  brightnessRestoreScript = writeShellScript "brightness-restore-script" ''
    ${pkgs.brightnessctl}/bin/brightnessctl --restore --min-value=4800
    ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --restore
  '';

  suspendScript = writeShellScript "suspend-script" ''
    ${pkgs.wireplumber}/bin/wpctl status | ${pkgs.ripgrep}/bin/rg active -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';

  beforeSleepScript = writeShellScript "before-sleep-script" ''
    ${pkgs.systemd}/bin/loginctl lock-session
    ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --save set 0
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
  '';

  afterSleepScript = writeShellScript "after-sleep-script" ''
    ${pkgs.hyprland}/bin/hyprctl dispatch dpms on
    ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --restore
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  '';

in {
  config = mkIf cfg.enable {
    # Hyprlock don't have the time to fully laod
    # https://github.com/hyprwm/hypridle/issues/49
    # https://github.com/hyprwm/hyprlock/issues/184
    services.hypridle = {
      settings = {
        general = {
          before_sleep_cmd = beforeSleepScript.outPath;
          after_sleep_cmd = afterSleepScript.outPath;
          lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          unlock_cmd = "pkill -USR1 hyprlock";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = brightnessDownScript.outPath;
            on-resume = brightnessRestoreScript.outPath;
          }
          {
            timeout = 330;
            on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
          }
          {
            timeout = 380;
            on-timeout = suspendScript.outPath;
          }
        ];
      };
    };
  };
}
