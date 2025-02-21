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

    my-shell
    astal.io # default astal lib to use cli
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;

    settings = with colorScheme.palette; {
      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
      ];

      general = {
        border_size = 0;

        gaps_in = 4;
        gaps_out = 8;

        "col.inactive_border" = "rgb(${background})";
        "col.active_border" = "rgb(${red}) rgb(${orange}) rgb(${yellow}) 180deg";

        layout = "dwindle";
        resize_on_border = true;
        hover_icon_on_border = false;

        # snapping ?
      };

      decoration = {
        rounding = 0;

        shadow = {
          enabled = true;
          range = 300;
          render_power = 4;
          ignore_window = true;
          offset = "0 40";
          color = "rgba(${black}af)";
          scale = 0.9;
        };

        blur = {
          enabled = true;
          size = 13;
          xray = false;
          passes = 3;
          new_optimizations = true;
          vibrancy_darkness = 2.0;
          vibrancy = 0.1696;
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
          "linear, 0.0, 0.0, 1.0, 1.0"
        ];
        animation = [
          "windows, 1, 2.5, myBezier, popin 80%"
          "border, 1, 2.5, myBezier"
          "fade, 1, 2.5, myBezier"
          "borderangle, 1, 6, quart"
          "workspaces, 1, 2.5, myBezier, slidefade 20%"
          "borderangle, 1, 100, linear, loop"
        ];
      };

      input = {
        kb_layout = "fr";
        kb_options = "caps:escape,fkeys:basic_13-24"; # disable capslock & weird-already-binded utilskeys
        repeat_rate = 40; # on long press
        repeat_delay = 300; # time to hold before repeating

        sensitivity = 0.25;
        accel_profile = "flat"; # no mouse acceleration
        follow_mouse = 1; # window focus under mouse
        float_switch_override_focus = 2; # same but with floating windows

        scroll_method = "2fg"; # 2 finger scroll
        touchpad = {
          disable_while_typing = true;
          clickfinger_behavior = true;
          natural_scroll = true; # invert
          drag_lock = true;
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
        background_color = "rgb(${background})";

        font_family = fontsProfiles.monospace.name;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;

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
