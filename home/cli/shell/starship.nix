{ colors, ... }:
{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = with colors; {
      format = ''$nix_shell$c$python$ocaml$directory$character'';      
      right_format = ''$git_branch$git_status'';    

      character = {
        format = "$symbol ";
        success_symbol = "[❯❯](#${base0B})";
        error_symbol = "[❯❯](#${base08})";
      };

      directory = {
        format = "[$path](#${base0D})[$read_only](#${base08}) "; 
        read_only = "🔒";
        truncation_length = 5;
        truncation_symbol = "";
        home_symbol = "🏠";
      };

      nix_shell = {
        format = "[🌨️ $name\($state\)](bold #${base15}) | ";
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
        format = "[C $version](bold #${base0C}) | ";
      };

      ocaml = {
        format = "[🐫 $version\($switch_indicator$switch_name\)](bold #${base0A}) | ";
      };

      python = {
        format = "[🐍 $version\($virtualenv\)](bold #${base0C}) | ";
      };
    };
  };
}
