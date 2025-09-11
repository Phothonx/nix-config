{...}: {
  programs.starship = {
    enable = false; # default fish prompt is peak
    enableFishIntegration = true;

    settings = {
      format = ''$character$direnv$nix_shell$username@$hostname$directory> '';

      character = {
        success_symbol = "[I](green)";
        error_symbol = "[I](green)";
        vimcmd_symbol = "[N](blue) ";
        vimcmd_replace_one_symbol = "[R](orange) ";
        vimcmd_replace_symbol = "[R](red) ";
        vimcmd_visual_symbol = "[V](purple) ";
      };

      username = {
        show_always = true;
        format = "[$usernane]($style) ";
        style_root = "bold yellow";
        style_user = "bold underline red";
      };

      hostname = {
        format = "[$hostname](bold dimmed grey) ";
        ssh_only = false;
      };

      directory = {
        format = "[$path]($style)($read_only_style) ";
        style = "bold cyan";
        read_only_style = "bold red";
        truncation_length = 4;
        truncation_symbol = "…";
      };

      nix_shell = {
        format = "[\($name/$state\)](bold purple) ";
        # heuristic = true;
        disabled = false;
      };

      direnv = {
        format = "[\($loaded/$allowed\)](bold orange) ";
        disabled = false;
      };
    };
  };
}
