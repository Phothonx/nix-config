{config, ...}: let
  inherit (config) colorScheme fontsProfiles;
in {
  programs.waybar.style = with colorScheme.base24; ''
    * {
      font-family: ${fontsProfiles.regular.name};
      font-size: 22px;
      border-radius: 4px;
      color: #${base07};
    }

    window#waybar {
      background-color: transparent;
    }

    .modules-left, .modules-right {
      background-color: #${base11};
      border-radius: 10px;
      padding: 6px;
    }

    .modules-center {
      background-color: #${base11};
      padding: 3px 6px 3px 6px;
      border-radius: 10px;
    }

    #workspaces button {
      min-height: 34px;
      font-size: 18px;
      background-color: #${base00};
      margin: 3px 0px 3px 0px;
    }
    #workspaces button:hover {
      background-color: #${base02};
    }
    #workspaces button.active {
      background-color: #${base0E};
    }
    #workspaces button.urgent {
      background-color: #${base08};
    }

    #image {
      background-color: transparent;
      margin: 6px 0px 3px 0px;
    }
    #custom-quit, custom-reboot, custom-power, custom-lock {
      background-color: transparent;
      color: #${base07};
      margin: 3px 0px 3px 0px;
    }
    #custom-quit:hover {
      color: #${base08};
    }
    #custom-reboot:hover {
      color: #${base08};
    }
    #custom-power:hover {
      color: #${base08};
    }
    #custom-lock:hover {
      color: #${base08};
    }

    #battery {
      min-height: 43px;
      background-color: #${base00};
      color: #${base0F};
      margin: 9px 0px 3px 0px;
    }
    #battery:hover {
      background-color: #${base02};
    }
    #battery.charging, #battery.plugged {
      color: #${base0B};
    }
    #battery.warning {
      color: #${base0A};
    }
    @keyframes blink {
      to {
        color: #${base07};
      }
    }

    /* Using steps() instead of linear as a timing function to limit cpu usage */
    #battery.critical:not(.charging) {
      color: #${base08};
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: steps(12);
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #network {
      min-height: 43px;
      background-color: #${base00};
      margin: 3px 0px 3px 0px;
      color: #${base0E};
    }
    #network:hover {
      background-color: #${base02};
    }
    #network.disconnected {
      color: #${base0A};
    }
    #network.disabled {
      color: #${base08};
    }

    #bluetooth {
      color: #${base0D};
      padding: 3px 0px 3px 0px;
      margin: 3px 0px 3px 0px;
    }
    #bluetooth.disabled {
      color: #${base08};
    }
    #bluetooth.off {
      color: #${base0A};
    }

    #wireplumber {
      min-height: 43px;
      background-color: #${base00};
      margin: 3px 0px 3px 0px;
      color: #${base0C};
    }
    #wireplumber:hover {
      background-color: #${base02};
    }
    #wireplumber.muted {
      color: #${base08};
    }

    #privacy {
      background-color: transparent;
    }

    #privacy-item {
      background-color: transparent;
      margin: 7px 0px 7px 0px;
      padding-left: 11px;
    }

    #backlight {
      min-height: 43px;
      background-color: #${base00};
      margin: 3px 0px 0px 0px;
      color: #${base0A};
    }
    #backlight:hover {
      background-color: #${base02};
    }

    #taskbar {
      margin: 0px 0px 3px 0px;
      background-color: #${base00};
    }
    #taskbar button {
      min-height: 31px;
      padding-top: 9px;
    }
    #taskbar button:hover {
      background-color: #${base02};
    }
    #taskbar button.active {
      background-color: #${base0E};
    }
    #taskbar.empty {
      background-color: transparent;
      margin: 0px;
      padding: 0px;
    }

    #tray {
      padding: 9px 0px 9px 0px;
      background-color: #${base00};
      margin: 3px 0px 3px 0px;
    }
    #tray:hover {
      background-color: #${base02};
    }

    #tray.empty {
      margin: 0px;
      padding: 0px;
      background-color: transparent;
    }

    #tray menu {
      font-size: 18;
      background-color: #${base00};
    }

    #clock {
      font-size: 31px;
      font-weight: bold;
      margin: 9px 0px 6px 0px;
    }

    tooltip {
      background-color: #${base10};
    }

    tooltip label {
      padding: 3px;
      background-color: #${base10};
      font-size: 17px;
    }
  '';
}
