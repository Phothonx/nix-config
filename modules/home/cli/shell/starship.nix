{ lib, config, ... }:
with lib;
let
  cfg = config.programs.starship;
  inherit (config) theme;
in
{
  config = mkIf cfg.enable {
    programs.starship = {
      enableBashIntegration = true;

      settings = with theme.palette; {
        format = ''$battery$nix_shell$c$python$ocaml$directory$character'';      
        right_format = ''$git_branch$git_status'';    

        character = {
          format = "$symbol ";
          success_symbol = "[❯❯](#${base0B})";
          error_symbol = "[❯❯](#${base08})";
          vimcmd_symbol = "[n❮](#${base09})";
          vimcmd_replace_one_symbol = "[r❯](#${base0F})";
          vimcmd_replace_symbol = "[r❯](#${base0F})";
          vimcmd_visual_symbol = "[v❮](#${base0E})";
        };

        directory = {
          format = "[$path](#${base0D})[$read_only](#${base08}) "; 
          read_only = "🔒";
          truncation_length = 5;
          truncation_symbol = "";
          home_symbol = "🏠";
        };

        battery = {
          format = "[$symbol$percentage](bold $style) | ";
          full_symbol = "🔋";
          charging_symbol = "⚡️";
          discharging_symbol = "🪫";
          display = [
            {
              threshold = 10;
              style = "bold #${base08}";
            }
            {
              threshold = 25;
              style = "bold #${base0A}";
            }
          ];
        };

        nix_shell = {
          format = "[🌨️$name\($state\)](bold #${base15}) | ";
          impure_msg = "[impure](bold red)";
          pure_msg = "[pure](bold green)";
          unknown_msg = "[unknown](bold yellow)";
        };

        git_branch = {
          format = "[🌱 $branch(:$remote_branch)](#${base0F}) ";
          truncation_length = 5;
          truncation_symbol = ".";
        };

        git_status = {
          # format = "[\[$all_status\]](bold #${colors.base07}) "; #$ahead_behind
          conflicted = "🏳";
          ahead = "🏎💨";
          behind = "😰";
          diverged = "😵";
          up_to_date = "✓";
          untracked = "🤷";
          stashed = "📦";
          modified = "📝";
          staged = "[++\($count\)](#${base0B})";
          renamed = "👅";
          deleted = "🗑";
        };

        c = {
          format = "[C$version](bold #${base0C}) | ";
        };

        ocaml = {
          format = "[🐫$version\($switch_indicator$switch_name\)](bold #${base0A}) | ";
        };

        python = {
          format = "[🐍$version\($virtualenv\)](bold #${base0C}) | ";
        };
      };
    };
  };
}
