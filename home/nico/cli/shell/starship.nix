{ ... }: {
  programs.starship = {
    enable = false;
    enableFishIntegration = true;
    enableTransience = true;

    settings = {
      format = ''$battery$nix_shell$directory$character'';
      # $sudo $direnv

      character = {
        success_symbol = "[I❯](bold green)";
        error_symbol = "[I✖](bold red)";
        vimcmd_symbol = "[N❮](bold blue)";
        vimcmd_replace_one_symbol = "[R❮](bold orange)";
        vimcmd_replace_symbol = "[R❮](bold yellow)";
        vimcmd_visual_symbol = "[V❮](bold purple)";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style) ";
        fish_style_pwd_dir_length = 1;
        repo_root_style = "italic blue";
        truncation_length = 4;
        home_symbol = "󰜥";
      };

      fill = {
        symbol = "-";
        style = "bold white";
      };

      time = {
        disabled = false;
      };

      sudo = {
        format = "[$symbol]($style) ▎";
        symbol = "👑";
        disabled = false;
      };

      battery = {
        format = "[$symbol$percentage]($style) ▎";
        discharging_symbol = "🪫";
        charging_symbol = "⚡️";
        display = [
          { threshold = 30; }
        ];
      };

      nix_shell = {
        format = "[$symbol\($name\)]($style) ▎";
        symbol = "🌨️ ";
        # heuristic = true;
      };

      direnv = {
        format = "[$symbol$loaded]($style) ▎";
        loaded_msg = "✅";
        unloaded_msg = "❌";
        disabled = false;
      };
    };
  };
}
