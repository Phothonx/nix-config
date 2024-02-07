{ colors, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = ''$c$python$ocaml$directory$character'';      
      right_format = ''$git_branch$git_status'';    

      character = {
        format = "$symbol ";
        success_symbol = "[❯❯](#${colors.base0B})";
        error_symbol = "[❯❯](#${colors.base08})";
      };

      directory = {
        format = "[$path](#${colors.base0D})[$read_only](#${colors.base08}) "; 
        read_only = "🔒";
        truncation_length = 4;
        truncation_symbol = "";
        home_symbol = "🏠";
      };

      git_branch = {
        format = "[🌱 $branch(:$remote_branch)](#${colors.base0F}) ";
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
        staged = "[++\($count\)](#${colors.base0B})";
        renamed = "👅";
        deleted = "🗑";
      };

      c = {
        format = "[C $version](bold #${colors.base0C}) ";
      };

      ocaml = {
        format = "[🐫 $version \($switch_indicator$switch_name\)](bold #${colors.base0A}) ";
      };

      python = {
        format = "[🐍 $version \($virtualenv\)](bold #${colors.base0C}) ";
      };
    };
  };
}