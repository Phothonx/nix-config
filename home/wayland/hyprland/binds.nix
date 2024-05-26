{ pkgs, lib, config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      "SUPER ALT, mouse:272, resizewindow"
    ];

    bindle= 
    let
      setVol = "wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@";
      getVol = "\"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' | sed 's/^0*//')\"";
      notifVol = "dunstify -h int:value:${getVol} -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/volume.svg -t 700 -r 2593 \"Volume: ${getVol}%\"";

      setBright = "brightnessctl set --min-value=4800";
      getBright = "\"$(( ($(cat /sys/class/backlight/*/brightness) * 100) / $(cat /sys/class/backlight/*/max_brightness) ))\"";
      notifBright = "dunstify -h int:value:${getBright} -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/brightness.svg -t 700 -r 2593 \"Brightness: ${getBright}%\"";
    in
    [
      " , code:68, exec, ${setVol} 2%- && ${notifVol}"
      " , code:69, exec, ${setVol} 2%+ && ${notifVol}"
      " , code:71, exec, ${setBright} 5%- && ${notifBright}"
      " , code:72, exec, ${setBright} +5% && ${notifBright}"
    ];

    bind = 
    let
      notifMute = "dunstify -i ${config.home.homeDirectory}/.dotfiles/home/services/dunst/assets/$( (wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo \"volume-mute.svg\") || echo \"volume.svg\" ) -t 500 -r 2593 \"Toggle Mute\"";
    in 
    [
      "SUPER, Q, exec, ${lib.getExe pkgs.kitty}"
      "SUPER, H, exec, ${lib.getExe pkgs.firefox}"
      "SUPER, R, exec, anyrun"
      "SUPER, E, exec, ${lib.getExe pkgs.gnome.nautilus}"
      "CTRL ALT, L, exec, hyprlock"

      " , code:67, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ${notifMute}"

      "SUPER, S, exec, hyprshot -o ${config.xdg.userDirs.pictures}/Screenshots -c -m output"
      "SUPER SHIFT, S, exec, hyprshot -o ${config.xdg.userDirs.pictures}/Screenshots -m region"

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

      "SUPER, code:10, workspace, 1"
      "SUPER, code:11, workspace, 2"
      "SUPER, code:12, workspace, 3"
      "SUPER, code:13, workspace, 4"
      "SUPER, code:14, workspace, 5"
      "SUPER, code:15, workspace, 6"
      "SUPER, code:16, workspace, 7"
      "SUPER, code:17, workspace, 8"
      "SUPER, code:18, workspace, 9"
      "SUPER, code:19, workspace, 10"

      "SUPER SHIFT, code:10, movetoworkspacesilent, 1"
      "SUPER SHIFT, code:11, movetoworkspacesilent, 2"
      "SUPER SHIFT, code:12, movetoworkspacesilent, 3"
      "SUPER SHIFT, code:13, movetoworkspacesilent, 4"
      "SUPER SHIFT, code:14, movetoworkspacesilent, 5"
      "SUPER SHIFT, code:15, movetoworkspacesilent, 6"
      "SUPER SHIFT, code:16, movetoworkspacesilent, 7"
      "SUPER SHIFT, code:17, movetoworkspacesilent, 8"
      "SUPER SHIFT, code:18, movetoworkspacesilent, 9"
      "SUPER SHIFT, code:19, movetoworkspacesilent, 10" 

      "SUPER CTRL, right, workspace, r+1"
      "SUPER CTRL, left, workspace, r-1"
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"  
    ];
  };
}
