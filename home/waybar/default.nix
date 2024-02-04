{ pkgs, lib, config, colors, ... }:
{
  programs.waybar = {
    enable = true;

    style = ''
        * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: Material Design Icons, Lexend, Iosevka Nerd Font;
    }

    window#waybar {
      background-color: rgba(24, 24, 37, 0.8);
      border-radius: 0px;
      color: #${colors.base05};
      box-shadow: 2px 3px 2px 2px #151515;
      font-size: 14px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #pulseaudio {
      color: #${colors.base06};
    }

    #custom-vpn,
    #network {
      color: #${colors.base09};
    }

    #cpu {
      color: #${colors.base0C};
    }

    #memory {
      color: #${colors.base09};
    }

    #clock {
      font-weight: 700;
      font-family: "Iosevka Term";
      padding: 0px 5px 0px 5px;
    }

    #workspaces button {
      background-color: transparent;
      /* Use box-shadow instead of border so the text isn't offset */
      color: #${colors.base0D};
      padding-left: 10px;
      box-shadow: inset 0 -3px transparent;
      transition: all 400ms cubic-bezier(0.250, 0.250, 0.555, 1.425);
    }

    #workspaces button:hover {
      color: #${colors.base0D};
      box-shadow: inherit;
      text-shadow: inherit;
    }

    #custom-power {
        color: #${colors.base08};
        padding: 0px 14px 0px 14px;
        margin-bottom: 20px;
    }

    #workspaces button.active {
      color: #${colors.base0A};
      transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }
    #workspaces button.urgent {
      background-color: #${colors.base09};
    }
    #clock,
    #network,
    #custom-swallow,
    #cpu,
    #battery,
    #backlight,
    #memory,
    #workspaces,
    #custom-todo,
    #custom-lock,
    #custom-vpn,
    #custom-weather,
    #custom-power,
    #custom-crypto,
    #volume,
    #pulseaudio {
      border-radius: 8px;
      background-color: rgba(49, 50, 68, 0.35);
      padding: 0px 14px 0px 14px;
      margin: 3px 0px 3px 0px;
    }

    #custom-lock {
        color: #${colors.base0D};
    }

    #custom-search {
      background-image: url("lol");
      background-size: 65%;
      background-position: center;
      padding: 0 13px;
      background-repeat: no-repeat;
    }
    #backlight {
      color: #${colors.base0A};
    }
    #battery {
      color: #${colors.base0B};
    }

    #battery.warning {
      color: #${colors.base0C};
    }

    #battery.critical:not(.charging) {
      color: #${colors.base08};
    }
    tooltip {
      font-family: 'Lato', sans-serif;
      border-radius: 15px;
      padding: 20px;
      margin: 30px;
    }
    tooltip label {
      font-family: 'Lato', sans-serif;
      padding: 20px;
    }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        spacing = 6;
        fixed-center = false;
        margin-left = null;
        margin-top = null;
        margin-bottom = null;
        margin-right = null;
        exclusive = true;
        modules-left = [
          "custom/search"
          "hyprland/workspaces"
          "custom/lock"
          "backlight"
          "battery"
        ];
        modules-right = ["cpu" "memory" "network" "clock" "custom/power"];
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          active-only = false;
          format-icons = {
            "1" = "󰪃";
            "2" = "󰩾";
            "3" = "󰪁";
            "4" = "󰪂";
            "5" = "󰪇";
            "6" = "󰪆";
            "7" = "󰩽";
            "8" = "󰩿";
            "9" = "󰪄";
            "10" = "󰪈";
          };
          persistent_workspaces = {
            "*" = 5;
          };
        };

        "custom/search" = {
          format = " ";
          tooltip = false;
          on-click = "wofi --show drun";
        };

        "custom/power" = {
          tooltip = false;
          # TODO
          format = "󰐥";
        };

        clock = {
          format = "{:%H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#f5c2e7'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#cba6f7'><b>T{:%U}</b></span>";
              weekdays = "<span color='#eba0ac'><b>{}</b></span>";
              today = "<span color='#a6e3a1'><b><u>{}</u></b></span>";
            };
            actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        memory = {
          interval = 2;
          format = "  {}%";
          max-length = 10;
        };

        cpu = {
          interval = 2;
          format = "󰍛 {}%";
          max-length = 10;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}% 󱐋{power}";
          format-charging = "󰚥{icon} {capacity}% 󱐋{power}";
          format-alt = "{icon} {capacity}%";
          format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = let
          nm-editor = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        in {
          format-wifi = "󰤨  {signalStrength}%";
          format-ethernet = "󰈀";
          format-alt = "󱛇";
          format-disconnected = "󰤭";
          tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
          on-click-right = "${nm-editor}";
        };
      };
    };
  };
}