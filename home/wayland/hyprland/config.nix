{ pkgs, lib, inputs, colors, config, theme, systemConfig, ... }:
let
  cavaLaunch = pkgs.writeShellScriptBin "cava-launch" ''
  sleep 1 && ${lib.getExe pkgs.cava}
  '';

  startScript = pkgs.writeShellScriptBin "start" ''
    ${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${theme.wallpaper}
    ${lib.getExe pkgs.waybar}
    dunst
    hyprctl setcursor ${theme.cursor.name} ${builtins.toString theme.cursor.size}
    hyprlock
  ''; #     kitty -o background_opacity=0 -o window_padding_width=0 --class="kitty-cava" ${lib.getExe cavaLaunch}
in
{
  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    # plugins = [
    #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
    # ];

    xwayland.enable = true;

    settings = with colors; {
      "$MOD" = "SUPER";

      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
      ];

      exec-once = "${lib.getExe startScript}";
      exec = "hyprshade";

      plugin = {
        # hyprwinwrap = {
        #   class = "kitty-cava";
        # };
      };

      general = {
          # no_border_on_floating = false
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;

          gaps_workspaces = 5;

          "col.inactive_border" = "rgb(${base00})";
          "col.active_border" = "rgba(${base07}00) rgb(${base0E}) 180deg";
      
          cursor_inactive_timeout = 0;
          layout = "dwindle";

          resize_on_border = true; # resize windows
      };

      decoration = {
          rounding = 14;

          drop_shadow = true; # lil shadow <3
          shadow_range = 15;
          shadow_render_power = 4;
          "col.shadow" = "rgb(${base10})";
          shadow_offset = "3 3";

          blur = { # this blurr <3
              enabled = true;
              size = 3;
              passes = 3;
              noise = 0.018;
              contrast = 0.9;
              brightness = 0.83;
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
          bezier = [ # taken from NotAShelf
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

      input  = {
        kb_layout = "${systemConfig.layout}";
        kb_options = "ctrl:nocaps"; # disable capslock
        repeat_rate = 47; # on long press
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
        hide_cursor_on_touch = false;
        disable_autoreload = true; # useless on nixos
      };
      
      binds = {};

    };
 };
}
