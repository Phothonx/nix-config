{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.niri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;

      runtimePkgs = with pkgs; [
        bibata-cursors
        wev
      ];

      settings = with self.theme; {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];
        # reload config once noctalia is up so the multi-output layout applies;
        # needs a shell because it is a multi-arg command, not a single binary.
        spawn-sh-at-startup = ["niri msg action load-config-file"];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        # the hotkey help is bound to Mod+Shift+Slash; no need to show it on login
        hotkey-overlay.skip-at-startup = _: {};

        input = {
          warp-mouse-to-focus = _: {};
          focus-follows-mouse = _: {};

          keyboard = {
            # put custom kblayout here
            xkb.layout = "nico,us,fr";
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            natural-scroll = _: {};
            tap = _: {};
            dwt = _: {};
            scroll-factor = 0.8;
            accel-profile = "flat";
            disabled-on-external-mouse = _: {};
          };

          mouse = {
            accel-speed = -0.7;
            accel-profile = "flat";
          };
        };

        clipboard.disable-primary = _: {};

        cursor = {
          xcursor-theme = "Bibata-Modern-Ice";
          xcursor-size = 24;
          hide-after-inactive-ms = 1000000;
        };

        window-rule = {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
        };

        layout = {
          gaps = 7;
          empty-workspace-above-first = _: {};

          focus-ring = {
            width = 2;
            active-color = base16;
          };

          shadow = {
            on = _: {};
          };
        };

        gestures = {
          hot-corners = {
            off = _: {};
          };
        };

        layer-rules = [
          {
            matches = [{namespace = "^noctalia-overview*";}];
            place-within-backdrop = true;
          }
        ];

        prefer-no-csd = _: {};

        outputs = {
          "Microstep MSI MAG271C 0x0000011E" = {
            position = _: {
              props.x = 0;
              props.y = 0;
            };
            # scale = 0.9;
            mode = "1920x1080@119.982";
            # FreeSync panel: engage VRR only for fullscreen apps that request it
            variable-refresh-rate = _: {
              props.on-demand = true;
            };
            focus-at-startup = _: {};
          };

          "Dell Inc. DELL S2240L YTFXY32208LT" = {
            position = _: {
              props.x = 2133;
              props.y = 0;
            };
            mode = "1920x1080@60.000";
          };
        };

        binds = let
          call = "${lib.getExe self'.packages.noctalia} ipc call";
        in {
          "Mod+Shift+Slash".show-hotkey-overlay = {};

          "Mod+T".spawn-sh = lib.getExe self'.packages.kitty;
          "Mod+Space".spawn-sh = "${call} launcher toggle";
          "Ctrl+Alt+Delete".spawn-sh = "${call} sessionMenu toggle";
          "Ctrl+Alt+L".spawn-sh = "${call} lockScreen lock";

          "Mod+Tab".toggle-overview = {};

          "Mod+Q".close-window = {};

          "Mod+H".focus-column-left = {};
          "Mod+J".focus-workspace-down = {};
          "Mod+K".focus-workspace-up = {};
          "Mod+L".focus-column-right = {};

          "Mod+Left".focus-column-left = {};
          "Mod+Down".focus-workspace-down = {};
          "Mod+Up".focus-workspace-up = {};
          "Mod+Right".focus-column-right = {};

          "Mod+Page_Down".focus-workspace-down = {};
          "Mod+Page_Up".focus-workspace-up = {};

          "Mod+Ctrl+H".move-column-left = {};
          "Mod+Ctrl+J".move-window-down = {};
          "Mod+Ctrl+K".move-window-up = {};
          "Mod+Ctrl+L".move-column-right = {};

          "Mod+Ctrl+Left".move-column-left = {};
          "Mod+Ctrl+Down".move-window-down = {};
          "Mod+Ctrl+Up".move-window-up = {};
          "Mod+Ctrl+Right".move-column-right = {};

          "Mod+Shift+H".focus-monitor-left = {};
          "Mod+Shift+J".focus-monitor-down = {};
          "Mod+Shift+K".focus-monitor-up = {};
          "Mod+Shift+L".focus-monitor-right = {};

          "Mod+Shift+Left".focus-monitor-left = {};
          "Mod+Shift+Down".focus-monitor-down = {};
          "Mod+Shift+Up".focus-monitor-up = {};
          "Mod+Shift+Right".focus-monitor-right = {};

          "Mod+Ctrl+Shift+H".move-column-to-monitor-left = {};
          "Mod+Ctrl+Shift+J".move-column-to-monitor-down = {};
          "Mod+Ctrl+Shift+K".move-column-to-monitor-up = {};
          "Mod+Ctrl+Shift+L".move-column-to-monitor-right = {};

          "Mod+Ctrl+Shift+Left".move-column-to-monitor-left = {};
          "Mod+Ctrl+Shift+Down".move-column-to-monitor-down = {};
          "Mod+Ctrl+Shift+Up".move-column-to-monitor-up = {};
          "Mod+Ctrl+Shift+Right".move-column-to-monitor-right = {};

          "Mod+Ctrl+U".move-column-to-workspace-down = {};
          "Mod+Ctrl+I".move-column-to-workspace-up = {};

          "Mod+Ctrl+Page_Down".move-column-to-workspace-down = {};
          "Mod+Ctrl+Page_Up".move-column-to-workspace-up = {};

          "Mod+Shift+U".move-workspace-down = {};
          "Mod+Shift+I".move-workspace-up = {};

          "Mod+Shift+Page_Down".move-workspace-down = {};
          "Mod+Shift+Page_Up".move-workspace-up = {};

          "Mod+Comma".consume-window-into-column = {};
          "Mod+Period".expel-window-from-column = {};

          "Mod+BracketLeft".consume-or-expel-window-left = {};
          "Mod+BracketRight".consume-or-expel-window-right = {};

          "Mod+R".switch-preset-column-width = {};
          "Mod+Shift+R".switch-preset-window-height = {};

          "Mod+F".maximize-column = {};
          "Mod+C".center-column = {};

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";

          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+Ctrl+R".reset-window-height = {};

          "Mod+Shift+F".fullscreen-window = {};
          "Mod+V".toggle-window-floating = {};
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};

          "Print".screenshot = {};
          "Alt+Print".screenshot-window = {};
          "Ctrl+Print".screenshot-screen = {};

          "Mod+S".screenshot-screen = {};
          "Mod+Shift+S".screenshot = {};
          "Mod+Ctrl+S".screenshot-window = {};

          "Mod+Shift+Delete".quit = {};

          "XF86AudioMute".spawn-sh = "${call} volume muteOutput";
          "XF86AudioRaiseVolume".spawn-sh = "${call} volume increase";
          "XF86AudioLowerVolume".spawn-sh = "${call} volume decrease";
          "XF86AudioMicMute".spawn-sh = "${call} volume muteInput";
          "XF86MonBrightnessDown".spawn-sh = "${call} brightness decrease";
          "XF86MonBrightnessUp".spawn-sh = "${call} brightness increase";
          "Mod+P".spawn-sh = "${call} controlCenter toggle";
        };
      };
    };
  };
}
