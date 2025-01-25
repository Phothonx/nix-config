{
  config,
  pkgs,
  ...
}: let
  inherit (config) colorScheme fontsProfiles;
in {
  home.packages = with pkgs; [
    brightnessctl
    volume
    brightness
    swww
    hyprshot
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;

    settings = with colorScheme.base24; {
      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
      ];

      general = {
        border_size = 2;

        gaps_in = 4;
        gaps_out = 8;

        "col.inactive_border" = "rgb(${base10})";
        "col.active_border" = "rgb(${base0E}) rgb(${base0D}) 180deg";

        layout = "dwindle";
      };

      decoration = {
        rounding = 0;

        shadow = {
          enabled = true;
          range = 10;
          render_power = 2;
          color = "rgba(0, 0, 0, 0.25)";
        };

        blur = {
          enabled = false;
          size = 5;
          passes = 3;
          new_optimizations = true;
          contrast = 1;
          brightness = 1;
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
          "myBezier, .5, .25, 0, 1"
          "quart, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 2.5, myBezier, popin 80%"
          "border, 1, 2.5, myBezier"
          "fade, 1, 2.5, myBezier"
          "borderangle, 1, 6, quart"
          "workspaces, 1, 2.5, myBezier, slidefade 20%"
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

        font_family = fontsProfiles.monospace.name;
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
}
