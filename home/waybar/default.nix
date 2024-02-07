{ pkgs, lib, config, colors, ... }:
{
  programs.waybar = {
    enable = true;

    style = ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-size: 17px;
    }

    window#waybar {
      background-color: #${colors.base01};
      border-radius: 7px;
      color: #ffffff;
      transition-property: background-color;
      transition-duration: 0.3s;
    }

    #clock {
      background-color: #${colors.base00};
      color: #CDD6F4;
      font-family: Ubuntu Nerd Font;
      font-size: 28px;
      font-weight: 700;
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #workspaces button {
      background-color: transparent;
      /* Use box-shadow instead of border so the text isn't offset */
      color: #${colors.base0E};
    }

    #workspaces button:hover {
      color: #${colors.base0F};
    }

    #custom-power {
      background-color: #${colors.base00};
        color: #${colors.base08}; 
        margin: 5px;
        padding: 5px;
        border-radius: 7px;
    }

    #workspaces button.active {
      color: #${colors.base0A};
    }

    #clock,
    #network,
    #battery,
    #backlight,
    #workspaces,
    #custom-menu,
    #custom-power,
    #wireplumber,

    #network {
      background-color: #${colors.base00};
      color: #${colors.base0D};
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #custom-menu {
      background-color: #${colors.base00};
      color: #${colors.base0E};
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #backlight {
      background-color: #${colors.base00};
      color: #${colors.base0A};
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #battery {
      background-color: #${colors.base00};
      color: #${colors.base0B};
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #battery.warning {
      background-color: #${colors.base00};
      color: #${colors.base0C};
    }

    #battery.critical:not(.charging) {
      color: #${colors.base08};
    }

    #wireplumber {
      background-color: #${colors.base00};
      color: #${colors.base0C};
      margin: 5px;
      padding: 5px;
      border-radius: 7px;
    }

    #wireplumber.muted {
      color: #${colors.base08};
    }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 50;
        spacing = 6;
        margin-left = 10;
        margin-top = 20;
        margin-bottom = 20;
        margin-right = null;

        modules-left = [
          "custom/menu"
          "backlight"
          "battery"
          "network"
          "wireplumber"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "clock"
          "custom/power"
          ];

        "hyprland/workspaces" = {
          on-click = "activate";
          show-special = true;
          format = "{icon}";
          format-icons = {
            "special" = "零";
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
          persistent_workspaces = {
            "*" = 5;
          };
        };

        "custom/menu" = {
          format = "";
          tooltip = false;
          on-click = "sleep 0.1 && wofi --show drun";
        };

        "custom/power" = {
          tooltip = false;
          format = "";
        };

        clock = {
          format = "{:%H%n%M}";
          tooltip = false;
        };

        backlight = {
          tooltip = false;
          format = " {icon}\n{percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            warning = 20;
            critical = 15;
          };
          format = " {icon}\n{capacity}%";
          format-charging = " {icon}󱐋\n{capacity}%";
          format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = {
          format-wifi = " 󰤨\n{signalStrength}%";
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip = false;
        };

        wireplumber = {
          format = " {icons}\n{volume}%";
          format-muted = " \nmuted";
          format-icons = ["" "" ""];
          tooltip = false;
        };
      };
    };
  };
}