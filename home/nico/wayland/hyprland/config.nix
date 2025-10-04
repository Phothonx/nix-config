{
  config,
  pkgs,
  ...
}: let
  inherit (config) colorScheme fontsProfiles;
in {
  home.packages = with pkgs; [
    astal.io # default astal lib to use cli
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    plugins = [];

    xwayland.enable = true;

    settings = with colorScheme.palette; {
      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
      ];

      plugin = {};

      general = {
        border_size = 2;

        gaps_in = 4;
        gaps_out = 8;

        "col.inactive_border" = "rgb(${d_grey})";
        "col.active_border" = "rgb(${grey})";

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
          color = "rgba(000000af)";
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

      input = {
        kb_layout = "nico";
        kb_options = "lv3:ralt_switch,caps:escape"; # disable capslock
        kb_variant = "basic";
        repeat_rate = 40; # on long press
        repeat_delay = 290; # time to hold before repeating

        sensitivity = 0.20;
        accel_profile = "flat"; # no mouse acceleration
        focus_on_close = 1;
        follow_mouse = 1; # window focus under mouse
        float_switch_override_focus = 2; # same but with floating windows

        scroll_method = "2fg"; # 2 finger scroll
        touchpad = {
          disable_while_typing = true;
          clickfinger_behavior = true;
          natural_scroll = true; # invert
          scroll_factor = 0.85;
        };
      };

      device = [
        {
          name = "@hfd-neo65";
          kb_layout = "nico";
          kb_variant = "basic";
          kb_options = "";
          repeat_rate = 40; # on long press
          repeat_delay = 290; # time to hold before repeating
        }
        {
          name = "compx-vxe-r1-pro"; # ,,compx-vxe-nordicmouse-1k-dongle-consumer-control-1,compx-vxe-nordicmouse-1k-dongle-1
          sensitivity = 0.18;
          accel_profile = "flat"; # no mouse acceleration
        }
        {
          name = "compx-vxe-nordicmouse-1k-dongle-1"; # ,compx-vxe-r1-pro-consumer-control-1,compx-vxe-nordicmouse-1k-dongle-consumer-control-1,compx-vxe-nordicmouse-1k-dongle-1
          sensitivity = 0.18;
          accel_profile = "flat"; # no mouse acceleration
        }
      ];

      gestures = {
        # workspace_swipe = true; # 3 fingers
        # workspace_swipe_distance = 250;
        # workspace_swipe_cancel_ratio = 0.5;
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
