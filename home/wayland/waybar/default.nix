{ pkgs, lib, config, colors, artwork, ... }:
{
  imports = [ ./style.nix ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 62;
        margin-left = 10;
        margin-top = 20;
        margin-bottom = 20;
        margin-right = null;
        fixed-center = false;

        modules-left = [
          "image"
          "backlight"
          "battery"
          "network"
          "wireplumber"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "wlr/taskbar"
          "clock"
          ];

        "hyprland/workspaces" = {
          on-click = "activate";
          show-special = false;
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
          persistent-workspaces = {
            "*" = 5;
          };
        };

        image ={
          path = "${config.home.homeDirectory}/.dotfiles/wallpapers/logo/nix-logo.png";
          size = 32;
          on-click = "";
          tooltip = false;
        };

        clock = {
          format = "{:%H%n%M}";
          tooltip-format = "";
        };

        "wlr/taskbar" = {
          all-outputs = true;
          icon-theme = artwork.icons.name;
          icon-size = 26;
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [
            "foot"
            "kitty"
          ]; 
        };

        backlight = {
          tooltip-format = "Brightness: {percent}%";
          format = " {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          on-click = "brightnessctl set --min-value=4800 70%";
          on-scroll-up = "brightnessctl set --min-value=4800 +5%";
          on-scroll-down = "brightnessctl set --min-value=4800 5%-";
        };

        battery = {
          interval = 5;
          states = {
            warning = 15;
            critical = 5;
          };
          format = " {icon}";
          format-charging = "{icon}";
          format-icons = {
            default = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
          tooltip-format = "Capacity: {capacity}%\nTime: {time}\nPower: {power}W";
        };

        network = {
          interval = 5;
          format-wifi = "{icon}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip-format-wifi = "SSID: {essid}\nWidth: ⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "IFname:  {ifname}\nWidth: ⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
	        tooltip-format-disconnected = "Disconnected"; 
          on-click = "";
        };

        wireplumber = {
          format = "{icon}";
          format-icons = ["󰖀" "󰕾" ""];
          format-muted = "󰝟";
          tooltip = "Volume: {volume}%\nNode: {node_name}";
          on-click = "helvum";
          on-scroll-up = "wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%+";
          on-scroll-down = "wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 2%-";
        };
      };
    };
  };
}
