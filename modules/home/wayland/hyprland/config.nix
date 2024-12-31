{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.wayland.windowManager.hyprland;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      brightnessctl
      volume
      brightness
      swww
      hyprshot
      hyprpicker
    ];

    wayland.windowManager.hyprland = {
      systemd = {
        enable = true;
        variables = ["--all"];
      };

      plugins = with pkgs; [
        # hyprlandPlugins.hyprexpo
        # hyprlandPlugins.hyprsplit
      ];

      xwayland.enable = true;

      settings = with theme.palette;
      with theme; {
        monitor = [
          "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
        ];

        plugin = {
          hyprexpo = {
            columns = 3;
            gap_size = 5;
            bg_col = "rgb(${base11})";
            workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

            enable_gesture = true; # laptop touchpad, 4 fingers
            gesture_distance = 300; # how far is the "max"
            gesture_positive = true; # positive = swipe down. Negative = swipe up.
          };

          hyprsplit = {
            num_workspaces = 5;
          };
        };

        general = with tweaks; {
          border_size = border_size;

          gaps_in = gaps_in;
          gaps_out = gaps_out;
          gaps_workspaces = 5;

          "col.inactive_border" = "rgb(${base10})";
          "col.active_border" = "rgb(${base0E}) rgb(${base0D}) 180deg";

          layout = "dwindle";
        };

        decoration = with tweaks; {
          rounding = rounding;

          shadow = {
            enabled = shadow.enabled; # lil shadow <3
            range = shadow.range;
            render_power = shadow.power;
            color = "rgb(${shadow.color})";
            offset = shadow.offset;
          };

          blur = with blur; {
            inherit
              (blur)
              enabled
              size
              passes
              noise
              contrast
              brightness
              vibrancy
              ;

            special = true; # nice but more expensive
            popups = true;
          };
        };

        master = {
          allow_small_split = false;
          mfact = 60;
        };

        dwindle = {
          force_split = 2;
          preserve_split = true;
          # smart_split = true; # choose split direction with cursor position on window
        };

        animations = {
          enabled = true;
          bezier = [
            # https://easings.net/
            "linear, 0.0, 0.0, 1.0, 1.0"
            "easeOutCubic, 0.33, 1, 0.68, 1"
            "overshot, 0.35, 0.9, 0.4, 1.1"
          ];
          animation = [
            "windows, 1, 3, overshot, popin"
            "windowsOut, 1, 3, overshot, slide"
            "windowsMove, 1, 1, overshot"

            "fade, 1, 3, easeOutCubic"

            "workspaces, 1, 3, overshot, slidevert"

            "border, 1, 2, easeOutCubic"
            "borderangle, 1, 75, linear, loop"
          ];
        };

        input = {
          kb_layout = "fr";
          kb_options = "caps:escape,fkeys:basic_13-24"; # disable capslock & weird-already-binded utilskeys
          repeat_rate = 40; # on long press
          repeat_delay = 250; # time to hold before repeating

          sensitivity = 0.25;
          accel_profile = "flat"; # no mouse acceleration
          follow_mouse = 1; # window focus under mouse
          float_switch_override_focus = 2; # same but with floating windows

          scroll_method = "2fg"; # 2 finger scroll
          touchpad = {
            disable_while_typing = false;
            clickfinger_behavior = true;
            natural_scroll = true; # invert
            scroll_factor = 0.75;
          };
        };

        gestures = {
          workspace_swipe = true; # 3 fingers
          workspace_swipe_distance = 250;
          workspace_swipe_cancel_ratio = 0.5;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          background_color = "rgb(${base00})";

          font_family = fonts.mono.name;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;

          #  enable_swallow = true;
          #  swallow_regex = "^(kitty)$";
          #  swallow_exception_regex = "^(xev|wev)$";

          focus_on_activate = true;
          animate_manual_resizes = false;
          animate_mouse_windowdragging = false;
          disable_autoreload = true; # useless on nixos
        };

        debug = {
          disable_logs = false;
        };
      };
    };
  };
}
