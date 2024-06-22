{ pkgs, lib, config, colors, artwork, ... }:
{
  imports = [ ./style.nix ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 55;
        margin-left = 10;
        margin-top = 10;
        margin-bottom = 10;
        margin-right = 0;
        fixed-center = true;
        spacing = 0;

        modules-left = [ "group/logo-power" "battery" "group/connections" "group/audio" "backlight" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "wlr/taskbar" "tray" "clock" ];

        "hyprland/workspaces" = {
          on-click = "activate";
          show-special = false;
          format = "{icon}";
          format-icons = {
            "default" = "";
            "active" = "󱓻";
            "urgent" = "󱓻";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "group/logo-power" = {
          orientation = "vertical";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "image"
            "custom/power"
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };
        image = {
          path = ./assets/nix-logo.png;
          size = 32;
          on-click = "walker";
          tooltip = false;
        };
        "custom/quit" = {
            format = "󰗼";
            tooltip = false;
            on-click = "systemctl suspend";
        };
        "custom/lock" = {
            format = "󰍁";
            tooltip = false;
            on-click = "hyprlock --immediate";
        };
        "custom/reboot" = {
            format = "󰜉";
            tooltip = false;
            on-click = "reboot";
        };
        "custom/power" = {
            format = "󰤂";
            tooltip = false;
            on-click = "shutdown now";
        };

        clock = {
          interval = 60;
          format = "{:%H%n%M}";
          tooltip = false;
          tooltip-format = "{:%d %m %Y}";
        };

        "wlr/taskbar" = {
          all-outputs = true;
          icon-theme = artwork.icons.name;
          icon-size = 25;
          on-click = "activate";
          on-click-right = "close";
          ignore-list = [ "kitty" "vesktop" ]; 
          tooltip = false;
        };

        backlight = {
          tooltip = false;
          tooltip-format = "backlight - {percent}%";
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          on-scroll-up = "brightnessctl set --min-value=4800 +5%";
          on-scroll-down = "brightnessctl set --min-value=4800 5%-";
          reverse-scrolling = true;
        };

        battery = {
          interval = 5;
          states = {
            warning = 15;
            critical = 5;
          };
          format = "{icon}";
          format-charging = "{icon}";
          format-icons = {
            default = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
          tooltip-format = "Capacity: {capacity}%\nTime: {time}\nPower: {power}W\nCycles: {cycles}";
          tooltip = false;
        };

        "group/connections" = {
          orientation = "vertical";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "network"
            "bluetooth"
          ];
        };

        network = {
          interval = 5;
          format-wifi = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          format-ethernet = "󰈀";
          format-disconnected = "";
          tooltip = false;
          tooltip-format-wifi = "SSID: {essid}\nWidth: ⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "IFname:  {ifname}\nWidth: ⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
	        tooltip-format-disconnected = "Disconnected"; 
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂲";
          format-off = "󰂲";
          format-on = "";
          format-connected = "󰂱";
          tooltip = false;
          tooltip-format = "Status: {status} {num_connections} connections\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias} - {device_address}";
        };

        "group/audio" = {
          orientation = "vertical";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [
            "wireplumber"
            "privacy#in"
            "privacy#out"
            "privacy#sc"
          ];
        };

        wireplumber = {
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          format-muted = "";
          tooltip = false;
          tooltip-format = "Volume: {volume}%\nNode: {node_name}";
          max-volume = 120;
          reverse-scrolling = 1;
          on-click = "pwvucontrol";
          on-click-right = "helvum";
          on-scroll-up = "wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%+";
          on-scroll-down = "wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%-";
        };

        "privacy#in" = {
	        icon-spacing = 4; 
	        icon-size = 21;
	        transition-duration = 250;
	        modules = [
	        	{ 
              type = "audio-in"; 
              tooltip = false;
            }
	        ];
        };
        "privacy#out" = {
	        icon-spacing = 4; 
	        icon-size = 24;
	        transition-duration = 250;
	        modules = [
	        	{ 
              type = "audio-out"; 
              tooltip = false;
            }
	        ];
        };
        "privacy#sc" = {
	        icon-spacing = 4; 
	        icon-size = 21;
	        transition-duration = 250;
	        modules = [
	        	{ 
              type = "screenshare"; 
              tooltip = false;
            }
	        ];
        };

        tray = {
          icon-size = 25;
          tooltip = false;
          spacing = 10;
        };
      };
    };
  };
}
