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
      swww
      hyprshot
      hyprpicker
    ];

    wayland.windowManager.hyprland = {
      systemd = {
        enable = true;
        variables = ["--all"];
      };

      # plugins = [
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      # ];

      xwayland.enable = true;

      settings = with theme.palette;
      with theme; {
        "$MOD" = "SUPER";

        monitor = [
          "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
        ];

        # plugin = {
        #   hyprwinwrap = {
        #     class = "kitty-cava";
        #   };
        #   hyprexpo = {
        #     columns = 3;
        #     gap_size = 5;
        #     bg_col = "rgb(${base11})";
        #     workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        #     enable_gesture = true; # laptop touchpad, 4 fingers
        #     gesture_distance = 300; # how far is the "max"
        #     gesture_positive = true; # positive = swipe down. Negative = swipe up.
        #   };
        # };

        general = with tweaks; {
          # no_border_on_floating = false
          gaps_in = gaps_in;
          gaps_out = gaps_out;
          border_size = border_size;

          gaps_workspaces = 5;

          "col.inactive_border" = "rgb(${base00})";
          "col.active_border" = "rgb(${base07}) rgb(${base0E}) 180deg";

          layout = "dwindle";

          resize_on_border = true; # resize windows
        };

        decoration = with tweaks; {
          rounding = rounding;

          drop_shadow = shadow.enabled; # lil shadow <3
          shadow_range = shadow.range;
          shadow_render_power = shadow.power;
          "col.shadow" = "rgb(${shadow.color})";
          shadow_offset = shadow.offset;

          blur = with blur; {
            # this blurr <3
            enabled = enabled;
            size = size;
            passes = passes;
            noise = noise;
            contrast = contrast;
            brightness = brightness;
            special = true; # nice but more expensive
            popups = true;
          };
        };

        dwindle = {
          preserve_split = true;
          smart_split = true; # choose split direction with cursor position on window
          special_scale_factor = 0.9;
        };

        animations = {
          enabled = true;
          bezier = [
            # taken from NotAShelf
            "linear, 0.0, 0.0, 1.0, 1.0" # border

            # linuxmobile
            "fluent_decel, 0, 0.2, 0.4, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutCubic, 0.33, 1, 0.68, 1"
            "easeinoutsine, 0.37, 0, 0.63, 1"
          ];
          animation = [
            "windowsIn, 1, 1.7, easeOutCubic, slide" # window open
            "windowsOut, 1, 1.7, easeOutCubic, slide" # window close
            "specialWorkspace, 1, 3, fluent_decel, slidevert" # special

            # fading
            "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
            "fadeOut, 1, 3, easeOutCubic" # fade out (close) -> layers and windows
            "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
            "workspaces, 1, 2, fluent_decel, slidevert" # styles: slide, slidevert, fade, slidefade, slidefadevert
            "specialWorkspace, 1, 3, fluent_decel, slidevert"

            "borderangle, 1, 100, linear, loop" # border
          ];
        };

        input = {
          kb_layout = "fr";
          kb_options = "ctrl:nocaps"; # disable capslock
          repeat_rate = 45; # on long press
          repeat_delay = 225; # time to hold before repeating
          sensitivity = 0.25;
          accel_profile = "flat"; # no mouse acceleration
          scroll_method = "2fg"; # 2 finger scroll
          follow_mouse = 1; # window focus under mouse
          float_switch_override_focus = 2; # same but with floating windows
          touchpad = {
            disable_while_typing = false;
            natural_scroll = true; # invert
            scroll_factor = 0.75;
          };
        };

        gestures = {
          workspace_swipe = true; # 3 fingers
          workspace_swipe_distance = 250;
          workspace_swipe_cancel_ratio = 0.7;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          background_color = "rgb(${base00})";

          focus_on_activate = true;
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          disable_autoreload = true; # useless on nixos
        };

        debug = {
          disable_logs = false;
        };
      };
    };
  };
}
