{ colors, theme, ... }:
{
  programs.waybar.style = with colors; ''
    * {
      font-family: ${theme.fonts.sansSerif.name};
      font-size: ${builtins.toString theme.fonts.sizes.desktop}px;

      border-radius: 10px;
    }

    window#waybar {
      background-color: #${base10};
      transition-property: background-color;
      transition-duration: 0.3s;
    }

    button:hover {
      background-color: #${base01};
    }

    #workspaces button {
      all: initial; /* Remove GTK theme values (waybar #1351) */
      min-width: 0; /* Fix weird spacing in materia (waybar #450) */
      background-color: transparent;
      color: #${base17};
      font-size: 14px;
      font-weight: bold;
      padding: 7px 0px 7px 0px;
      border-radius: 10px;
      margin: 3px 5px 3px 5px;
    }

    #workspaces button:hover {
      color: #${base0D};
      background-color: #${base01};
    }

    #workspaces button.active {
      color: #${base0F};
      background-color: #${base01};
    }

    #clock,
    #taskbar,
    #network,
    #battery,
    #backlight,
    #workspaces,
    #wireplumber,
    #image,

    #image {
      margin: 20px 0px 10px 0px;
    }

    #clock {
      color: #${base17};
      font-family: Ubuntu Nerd Font;
      font-size: 32px;
      font-weight: bold;
      margin: 5px 0px 20px 0px;
    }

    #taskbar {
      background-color: #${base00};
      margin: 3px 0px 3px 0px;
      padding: 5px;
    }

    #taskbar button {
      padding: 7px 0px 7px 0px;
    }

    #taskbar button:hover {
      background-color: #${base01};
    }

    #taskbar button.active {
      background-color: #${base01};
    }

    #taskbar.empty {
      background-color: transparent;
      margin: 0px;
      padding: 0px;
      border-radius: 0px;
    }

    #network {
      background-color: #${base00};
      color: #${base0D};
      margin: 3px 0px 3px 0px;
      padding: 10px 5px 10px 5px;
    }

    #backlight {
      background-color: #${base00};
      color: #${base0A};
      margin: 3px 0px 3px 0px;
      padding: 10px 5px 10px 5px;
    }

    #battery {
      background-color: #${base00};
      color: #${base0B};
      margin: 3px 0px 3px 0px;
      padding: 10px 5px 10px 5px;
    }

    #battery.warning {
      background-color: #${base00};
      color: #${base0C};
    }

    #battery.critical:not(.charging) {
      color: #${base08};
    }

    #wireplumber {
      background-color: #${base00};
      color: #${base0C};
      margin: 3px 0px 3px 0px;
      padding: 10px 5px 10px 5px;
    }

    #wireplumber.muted {
      color: #${base08};
    }
    
    tooltip {
      border-radius: 8px;
      padding: 15px;
      background-color: #${base10};
      font-size: 6px;
    }
      
    tooltip label {
      padding: 5px;
      background-color: #${base10};
    }
  '';
}
