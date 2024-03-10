{ pkgs, lib, config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      "SUPER ALT, mouse:272, resizewindow"
    ];

    bindle = [
      " , code:68, exec, wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%-"
      " , code:69, exec, wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%+"
      " , code:71, exec, brightnessctl set --min-value=4800 5%-"
      " , code:72, exec, brightnessctl set --min-value=4800 +5%"
    ];

    bind = [
      "SUPER, Q, exec, ${lib.getExe pkgs.foot}"
      "SUPER, H, exec, ${lib.getExe pkgs.firefox}"
      "SUPER, R, exec, ${lib.getExe pkgs.wofi} --show drun"
      "CTRL ALT, L, exec, hyprlock"

      " , code:67, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      "SUPER, S, exec, hyprshot -o ${config.home.homeDirectory}/Medias/Screenshots -m eDP-1"
      "SUPER SHIFT, S, exec, hyprshot -o ${config.home.homeDirectory}/Medias/Screenshots -m region"

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
