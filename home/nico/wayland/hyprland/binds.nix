{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      "SUPER ALT, mouse:272, resizewindow"
    ];

    bindle = with pkgs; [
      " , XF86AudioLowerVolume, exec, ${volume}/bin/volume down 2"
      " , XF86AudioRaiseVolume, exec, ${volume}/bin/volume up 2"
      " , XF86MonBrightnessDown, exec, ${brightness}/bin/brightness down 5"
      " , XF86MonBrightnessUp, exec, ${brightness}/bin/brightness up 5"
    ];

    binde = [
      ### RESIZE ###
      "SUPER SHIFT ALT, left, resizeactive, -5% 0%"
      "SUPER SHIFT ALT, right, resizeactive, 5% 0%"
      "SUPER SHIFT ALT, up, resizeactive, 0% 5%"
      "SUPER SHIFT ALT, down, resizeactive, 0% -5%"
      "SUPER SHIFT ALT, L, resizeactive, -5% 0%"
      "SUPER SHIFT ALT, M, resizeactive, 5% 0%"
      "SUPER SHIFT ALT, K, resizeactive, 0% 5%"
      "SUPER SHIFT ALT, J, resizeactive, 0% -5%"
    ];

    bindl = with pkgs; [
      " , XF86AudioMute, exec, ${volume}/bin/volume toggle"
    ];

    bind = with pkgs; [
      ### APPS SHORTCUTS ###
      "SUPER, Q, exec, ${kitty}/bin/kitty"
      "SUPER SHIFT, Q, exec, [float] kitty"
      "SUPER, Z, exec, ${zed-editor}/bin/zed"
      "SUPER, B, exec, ${firefox}/bin/firefox"
      "SUPER, R, exec, ${tofi}/bin/tofi-drun"
      "SUPER, E, exec, ${nautilus}/bin/nautilus"
      "SUPER, D, exec, ${vesktop}/bin/vesktop"
      "CTRL ALT, L, exec, ${hyprlock}/bin/hyprlock"

      ### SCREENSHOTS ###
      "SUPER, S, exec, hyprshot --mode active --mode output --output-folder ${config.home.homeDirectory}/Medias/Screenshots"
      "SUPER ALT, S, exec, hyprshot --mode window --output-folder ${config.home.homeDirectory}/Medias/Screenshots"
      "SUPER SHIFT, S, exec, hyprshot --freeze --mode region --output-folder ${config.home.homeDirectory}/Medias/Screenshots"

      "SUPER, P, exec, ${hyprpicker}/bin/hyprpicker --format hex --autocopy"

      ### CLOSE ###
      "SUPER, C, killactive,"
      "SUPER SHIFT CTRL, B, exit,"

      ### MOVE FOCUS ###
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      "SUPER, Tab, cyclenext, "
      "SUPER, Tab, alterzorder, top"

      ### MOVE WINDOWS ###
      "SUPER ALT, left, movewindow, l"
      "SUPER ALT, right, movewindow, r"
      "SUPER ALT, up, movewindow, u"
      "SUPER ALT, down, movewindow, d"
      "SUPER ALT, H, movewindow, l"
      "SUPER ALT, L, movewindow, r"
      "SUPER ALT, K, movewindow, u"
      "SUPER ALT, J, movewindow, d"

      "SUPER SHIFT, left, swapwindow, l"
      "SUPER SHIFT, right, swapwindow, r"
      "SUPER SHIFT, up, swapwindow, u"
      "SUPER SHIFT, down, swapwindow, d"
      "SUPER SHIFT, H, swapwindow, l"
      "SUPER SHIFT, L, swapwindow, r"
      "SUPER SHIFT, K, swapwindow, u"
      "SUPER SHIFT, J, swapwindow, d"

      ### FLOAT & SPLIT ###
      "SUPER, Space, togglefloating,"
      "SUPER SHIFT, Space, workspaceopt, allfloat"

      "SUPER, G, togglesplit,"

      "SUPER, F, fullscreen,"

      "SUPER, P, pin"

      ### WORKSPACES ###
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

      "SUPER CTRL, j, workspace, e +1"
      "SUPER CTRL, k, workspace, e -1"
      "SUPER CTRL, down, workspace, e +1"
      "SUPER CTRL, up, workspace, e -1"
    ];
  };
}
