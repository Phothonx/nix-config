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
      " , XF86AudioLowerVolume, exec, ${wireplumber}/bin/wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 2%-"
      " , XF86AudioRaiseVolume, exec, ${wireplumber}/bin/wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 2%+"
      " , XF86MonBrightnessDown, exec, ${brightnessctl}/bin/brightnessctl --min-value=4800 set 2%-"
      " , XF86MonBrightnessUp, exec, ${brightnessctl}/bin/brightnessctl --min-value=4800 set 2%+"
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
      " , XF86AudioMute, exec, ${wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    bind = with pkgs; [
      ### APPS SHORTCUTS ###
      "SUPER, Q, exec, ${kitty}/bin/kitty"
      "SUPER SHIFT, Q, exec, [float] ${kitty}/bin/kitty"
      "SUPER, B, exec, ${firefox}/bin/firefox"
      "SUPER, R, exec, astal --instance astal-lua --toggle-window launcher"
      "SUPER, E, exec, ${xfce.thunar}/bin/thunar"
      "CTRL ALT, L, exec, ${hyprlock}/bin/hyprlock"

      # discord
      "SUPER, D, exec, ${discord}/bin/discord"
      ", XF86Forward, pass, class:^(discord)$"
      ", XF86Back, pass, class:^(discord)$"

      ", XF86Forward, pass, class:^(TeamSpeak)$"
      ", XF86Back, pass, class:^(TeamSpeak$"

      ### SCREENSHOTS ###
      "SUPER, S, exec, ${hyprshot}/bin/hyprshot --mode active --mode output --output-folder ${config.home.homeDirectory}/Medias/Screenshots"
      "SUPER ALT, S, exec, ${hyprshot}/bin/hyprshot --mode window --output-folder ${config.home.homeDirectory}/Medias/Screenshots"
      "SUPER SHIFT, S, exec, ${hyprshot}/bin/hyprshot --freeze --mode region --output-folder ${config.home.homeDirectory}/Medias/Screenshots"

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

      "SUPER SHIFT, P, pin"

      ### WORKSPACES ###
      "SUPER, A, togglespecialworkspace"
      "SUPER SHIFT, A, movetoworkspace, special"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPER SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER SHIFT, 4, movetoworkspacesilent, 4"
      "SUPER SHIFT, 5, movetoworkspacesilent, 5"
      "SUPER SHIFT, 6, movetoworkspacesilent, 6"
      "SUPER SHIFT, 7, movetoworkspacesilent, 7"
      "SUPER SHIFT, 8, movetoworkspacesilent, 8"
      "SUPER SHIFT, 9, movetoworkspacesilent, 9"
      "SUPER SHIFT, 0, movetoworkspacesilent, 10"
    ];
  };
}
