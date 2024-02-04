{
    bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
        "SUPER ALT, mouse:272, resizewindow"
    ];

    bindle = [
        " , code:68, exec, wpctl set-volume --limit 1.2 @DEFAULT_AUDIO_SINK@ 2%-"
        " , code:69, exec, wpctl set-volume --limit 1.2 @DEFAULT_AUDIO_SINK@ 2%+"
        " , code:71, exec, brightnessctl set --min-value=4800 5%-"
        " , code:72, exec, brightnessctl set --min-value=4800 +5%"
    ];

    bind = [
        "SUPER, Q, exec, kitty"
        "SUPER, H, exec, firefox"
        "SUPER, R, exec, wofi --show drun"
        "SUPER, N, exec, swaync-client -t --hide-latest"
        "CTRL ALT, L, exec, swaylock --screenshots --effect-blur=8x7"

        " , code:67, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        "SUPER, C, killactive," 
        "SUPER_SHIFT, M, exit,"
        "SUPER, M, exec, hyprctl reload"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, l, movefocus, l"
        "SUPER, m, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"
        "SUPER, Tab, cyclenext, "
        "SUPER, Tab, bringactivetotop, "

        # "ALT, tab, hycov:toggleoverview, "
        # "ALT, left, hycov:movefocus, l"
        # "ALT, right, hycov:movefocus, r"
        # "ALT, up, hycov:movefocus, u"
        # "ALT, down, hycov:movefocus, d"

        "SUPER, P, pseudo,"
        "SUPER SHIFT, P, workspaceopt, allpseudo"
        "SUPER, Space, togglefloating,"
        "& SHIFT, Space, workspaceopt, allfloat"
        "SUPER, J, togglesplit,"
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
}