{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      right_format = "$cmd_duration";  

      directory = {
        format = "[](fg:#252525 bg:none)[$path]($style)[█](fg:#232526 bg:#232526)[](fg:#6791C9 bg:#252525)[ ](fg:#252525 bg:#6791C9)[](fg:#6791C9 bg:none)";
        style = "fg:#E8E3E3 bg:#252525 bold";
        truncation_length = 3;
        truncate_to_repo=false;
        read_only = " ";
      };

      character = {
        success_symbol = "[ ](bold #89b4fa)[ ➜](bold green)";
        error_symbol = "[ ](bold #89dceb)[ ✗](bold red)";
      };

      cmd_duration = {
        format = "[](fg:#252525 bg:none)[$duration]($style)[](fg:#252525 bg:#252525)[](fg:#C397D8 bg:#252525)[󱑂 ](fg:#252525 bg:#C397D8)[](fg:#C397D8 bg:none)";
        disabled = false;
        style = "fg:#E8E3E3 bg:#252525 bold";
      };          
    };

  };
}