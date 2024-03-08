{ pkgs, lib, inputs, colors, config, theme,... }:
let
  pal = theme.sheme.palette;

  bindings = import ./binds.nix;
  rules = import ./rules.nix;

  startScript = pkgs.writeShellScriptBin "start" ''
    ${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${config.home.homeDirectory}/.dotfiles/wallpapers/cat_leaves.png
    ${lib.getExe pkgs.waybar}
    swaync
    swayosd-server
    hyprctl setcursor Bibata-Modern-Ice 22
    ${lib.getExe pkgs.swaylock} -i ${config.home.homeDirectory}/.dotfiles/wallpapers/cat_leaves.png
  '';
in
{
  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    xwayland.enable = true;

    # plugins = [
    #   inputs.hycov.packages.${pkgs.system}.hycov
    #   inputs.hyprfocus.packages.${pkgs.system}.hyprfocus
    # ];

    settings = {
        "$MOD" = "SUPER";

        monitor = [
          "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
        ];

        exec-once = "${lib.getExe startScript}";

      general = {
          # no_border_on_floating = false
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;

          gaps_workspaces = 5;

          # string to set attribute "col.inactive_border" and not .inactive_border from subset col
          "col.inactive_border" = "rgb(${colors.base02})";
          "col.active_border" = "rgb(${pal.base00})";
      
          cursor_inactive_timeout = 0;
          layout = "dwindle";
      
          resize_on_border = true; # resize windows
          hover_icon_on_border = false;
      };

      # plugin = {
      #   hycov = {};
      #   hyprfocus = {
      #     enabled = true;

      #     keyboard_focus_animation = "shrink";
      #     mouse_focus_animation = "srink";

      #     bezier = [
      #       "bezIn, 0.5,0.0,1.0,0.5"
      #       "bezOut, 0.0,0.5,0.5,1.0"
      #     ];

      #     shrink = {
      #       shrink_percentage = 0.8;
 
      #       in_bezier = "bezIn";
      #       in_speed = 0.5;

      #       out_bezier = "bezOut";
      #       out_speed = 3;
      #     };
      #   };
      # };
      
      decoration = {
          rounding = 15;
          
          # active_opacity = 1.0
          # inactive_opacity = 1.0
          # fullscreen_opacity = 1.0
      
          drop_shadow = true; # lil shadow <3
          shadow_range = 15;
          shadow_render_power = 5;
          "col.shadow" = "0xee11111B";
          shadow_offset = "2 2";

          blur = { # this blurr <3
              enabled = true;
              size = 2;
              passes = 3;
              # xray = true;
              noise = 0.020;
              contrast = 0.9;
              brightness = 0.83;
              special = true; # nice but more expensive
              popups = true;
          };
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
          smart_split = true; # choose split direction with cursor position on window
          special_scale_factor = 0.9; # forgot whit it is lol
      };

      animations = {
          enabled = true;
          bezier = [ # taken from NotAShelf
            "smoothOut, 0.36, 0, 0.66, -0.56"
            "smoothIn, 0.25, 1, 0.5, 1"
            "overshot, 0.4,0.8,0.2,1.2"
          ];
          animation = [
            "windows, 1, 4, overshot, slide"
            "windowsOut, 1, 4, smoothOut, slide"
            "border,1,10,default"

            "fade, 1, 10, smoothIn"
            "fadeDim, 1, 10, smoothIn"
            "workspaces,1,4,overshot,slidevert"
          ];
      };

      input  = {
        kb_layout = "fr";
        kb_options = "ctrl:nocaps"; # disable capslock
        repeat_rate = 50; # on long press
        repeat_delay = 400; # time to hold before repeating
        sensitivity = 0.2;
        accel_profile = "flat"; # no mouse acceleration
        scroll_method = "2fg"; # 2 finger scroll
        follow_mouse = 1; # window focus under mouse
        float_switch_override_focus = 2; # same but with floating windows
        touchpad = {
            disable_while_typing = false;
            natural_scroll = true; # invert
            scroll_factor = 0.8;
        };
      };

      gestures = {
          workspace_swipe = true; # 3 fingers
          workspace_swipe_distance = 250;
          workspace_swipe_cancel_ratio = 0.7;
      };
      
      misc = {
          disable_hyprland_logo = true; # wallpaper covers it anyway
          disable_splash_rendering = true;
          background_color = "rgb(${colors.base00})";

          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          hide_cursor_on_touch = false;
          disable_autoreload = true; # useless on nixos
      };
      
      binds = {};
      
      # XWayland = {
      #     force_zero_scaling = true; # solve piexlated windows
      # };
      
      inherit bindings rules;
    };
 };

}
