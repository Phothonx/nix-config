{pkgs, ...}: let
  inherit (pkgs) writeShellScript;

  suspendScript = writeShellScript "suspend-script" ''
    ${pkgs.wireplumber}/bin/wpctl status | ${pkgs.ripgrep}/bin/rg active -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';

  beforeSleepScript = writeShellScript "before-sleep-script" ''
    # ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --save set 0
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
    ${pkgs.systemd}/bin/loginctl lock-session
  '';

  afterSleepScript = writeShellScript "after-sleep-script" ''
    ${pkgs.hyprland}/bin/hyprctl dispatch dpms on
    # ${pkgs.brightnessctl}/bin/brightnessctl --device="platform::kbd_backlight" --restore
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  '';
in {
  home.packages = [pkgs.hypridle];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = beforeSleepScript.outPath;
        after_sleep_cmd = afterSleepScript.outPath;
        lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        unlock_cmd = "pkill -USR1 hyprlock";
        inhibit_sleep = 3;
      };

      listener = [
        # {
        #   timeout = 150; # 2.5min, keyboard lights
        #   on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl --device=\"platform::kbd_backlight\" --save set 0";
        #   on-resume = "${pkgs.brightnessctl}/bin/brightnessctl --device=\"platform::kbd_backlight\" --restore";
        # }
        {
          timeout = 300; # 5min, lock
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 360; # 6min, luminosity down
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl --save --min-value=4800 set 50%-";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl --restore --min-value=4800";
        }

        {
          timeout = 420; # 7min, screen off
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 480; # 8min, sleep
          on-timeout = suspendScript.outPath;
        }
      ];
    };
  };
}
