{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.wayland.windowManager.hyprland;
in
{
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
        "SUPER ALT, mouse:272, resizewindow"
      ];

      bindle = 
      let
        setVol = "wpctl set-volume --limit 1.2 @DEFAULT_AUDIO_SINK@";
        getVol = "\"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' | sed 's/^0*//')\"";
        notifVol = "dunstify -h int:value:${getVol} -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/volume.svg -t 700 -r 2593 \"Volume: ${getVol}%\"";

        setBright = "brightnessctl set --min-value=4800";
        getBright = "\"$(( ($(cat /sys/class/backlight/*/brightness) * 100) / $(cat /sys/class/backlight/*/max_brightness) ))\"";
        notifBright = "dunstify -h int:value:${getBright} -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/brightness.svg -t 700 -r 2593 \"Brightness: ${getBright}%\"";
      in
      [
        " , XF86AudioLowerVolume, exec, ${setVol} 2%- && ${notifVol}"
        " , XF86AudioRaiseVolume, exec, ${setVol} 2%+ && ${notifVol}"
        " , XF86MonBrightnessDown, exec, ${setBright} 5%- && ${notifBright}"
        " , XF86MonBrightnessUp, exec, ${setBright} +5% && ${notifBright}"
      ];

      bind = 
      let
        notifMute = "dunstify -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/$( (wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo \"volume-mute.svg\") || echo \"volume.svg\" ) -t 500 -r 2593 \"Toggle Mute\"";
      in 
      [
        "SUPER, Q, exec, ${lib.getExe pkgs.kitty}"
        "SUPER, H, exec, ${lib.getExe pkgs.firefox}"
        "SUPER, R, exec, tofi-drun"
        "SUPER, E, exec, ${lib.getExe pkgs.nautilus}"
        "CTRL ALT, L, exec, hyprlock"

        # "SUPER, Tab, hyprexpo:expo, toggle"

        " , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ${notifMute}"

        "SUPER, S, exec, hyprshot -o ${config.home.homeDirectory}/Medias/Screenshots -c -m output"
        "SUPER SHIFT, S, exec, hyprshot -o ${config.home.homeDirectory}/Medias/Screenshots -m region"

        "SUPER SHIFT, C, exec, ${lib.getExe pkgs.hyprpicker} -f hex -a"

        "SUPER, C, killactive," 
        "SUPER SHIFT, M, exit,"
        "SUPER, M, exec, hyprctl reload"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, L, movefocus, l"
        "SUPER, M, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"
        "SUPER, Tab, cyclenext, "
        "SUPER, Tab, bringactivetotop, "

        "SUPER, Space, togglefloating,"
        "SUPER SHIFT, Space, workspaceopt, allfloat"
        "SUPER, G, togglesplit,"
        "SUPER, F, fullscreen,"

        "SUPER, P, pin"

        "SUPER, A, togglespecialworkspace"
        "SUPER SHIFT, A, movetoworkspace, special"

        "SUPER, ampersand, workspace, 1"
        "SUPER, eacute, workspace, 2"
        "SUPER, quotedbl, workspace, 3"
        "SUPER, apostrophe, workspace, 4"
        "SUPER, parenleft, workspace, 5"
        "SUPER, minus, workspace, 6"
        "SUPER, egrave, workspace, 7"
        "SUPER, underscore, workspace, 8"
        "SUPER, ccedilla, workspace, 9"
        "SUPER, agrave, workspace, 10"

        "SUPER SHIFT, ampersand, movetoworkspacesilent, 1"
        "SUPER SHIFT, eacute, movetoworkspacesilent, 2"
        "SUPER SHIFT, quotedbl, movetoworkspacesilent, 3"
        "SUPER SHIFT, apostrophe, movetoworkspacesilent, 4"
        "SUPER SHIFT, parenleft, movetoworkspacesilent, 5"
        "SUPER SHIFT, minus, movetoworkspacesilent, 6"
        "SUPER SHIFT, egrave, movetoworkspacesilent, 7"
        "SUPER SHIFT, underscore, movetoworkspacesilent, 8"
        "SUPER SHIFT, ccedilla, movetoworkspacesilent, 9"
        "SUPER SHIFT, agrave, movetoworkspacesilent, 10" 

        "SUPER CTRL, right, workspace, r+1"
        "SUPER CTRL, left, workspace, r-1"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"  
      ];
    };
  };
}
