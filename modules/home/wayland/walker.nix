{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.programs.walker;
  inherit (config) theme;
in {
  imports = [inputs.walker.homeManagerModules.default];

  config = mkIf cfg.enable {
    programs.walker = {
      runAsService = true;
      config = {
        placeholder = "Search...";
        keep_open = false;
        ignore_mouse = true;
        notify_on_fail = true;
        terminal = "kitty";
        force_keyboard_focus = true;
        ssh_host_file = "";
        enable_typeahead = true;
        show_initial_entries = true;
        fullscreen = false;
        scrollbar_policy = "automatic";
        hyprland = {
          context_aware_history = false;
        };
        applications = {
          disable_cache = false;
        };
        activation_mode = {
          disabled = false;
          use_f_keys = false;
          use_alt = false;
        };
        search = {
          delay = 0;
          hide_icons = false;
          margin_spinner = 0;
          hide_spinner = true;
        };
        runner.excludes = ["rm"];
        clipboard = {
          max_entries = 10;
          image_height = 300;
        };
        align = {
          ignore_exlusive = true;
          width = 700;
          horizontal = "center";
          vertical = "start";
          anchors = {
            top = false;
            left = false;
            bottom = false;
            right = false;
          };
          margins = {
            top = 0;
            bottom = 0;
            end = 0;
            start = 0;
          };
        };
        list = {
          height = 600;
          margin_top = 0;
          always_show = true;
          hide_sub = true;
        };
        orientation = "vertical";
        icons = {
          theme = theme.icons.name;
          hide = false;
          size = 40;
          image_height = 200;
        };
        modules = [
          {
            name = "applications";
            prefix = "";
          }
          {
            name = "runner";
            prefix = ":";
          }
          {
            name = "finder";
            prefix = "/";
            switcher_exclusive = true;
          }
          {
            name = "hyprland";
            prefix = "!";
          }
          {
            name = "clipboard";
            prefix = ".";
          }
        ];
      };
      theme = {
        style = with theme.palette;
        with theme; ''
          * {
            font: bold 1.1rem "${fonts.normal.name}";
            color: #${base07};
            border-radius: 8px;
          }

          #window {
            background: transparent;
          }

          #box {
            padding: 10px;
            min-height: 0;
          }

          #search {
            font: italic 1.2rem "${fonts.normal.name}";
            border-radius: 8px;
            outline: none;
            outline-width: 0px;
            box-shadow: 4px 4px 5px 2px #${base11};
            border: 2px solid #${accent};
            background: #${base00};
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
          }

          #search placeholder {
            opacity: 0.5;
          }

          #scrollbar {
            opacity: 0;
            outline: none;
            outline-width: 0px;
            border: none;
          }

          #list {
            margin-top: 30px;
            border: 2px solid #${accent};
            box-shadow: 4px 4px 5px 2px #${base11};
            background: #${base00};
            min-height: 0;
            padding: 5px;
          }

          list *:selected {
            background: #${base00};
            border-radius: 3px;
          }

          .item {
            padding: 5px;
          }

          .icon {
            padding-right: 10px;
          }

          .textwrapper {
          }

          .label {
          }

          .sub {
            opacity: 0.5;
          }

          .activationlabel {
            opacity: 0.25;
          }

          .activation .activationlabel {
            opacity: 1;
            color: #76946a;
          }

          .activation .textwrapper,
          .activation .icon,
          .activation .search {
            opacity: 0.5;
          }
        '';
      };
    };
  };
}
