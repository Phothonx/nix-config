{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      brightnessctl

      zip
      unzip
      ripgrep
    ];

    programs = {

      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };

      eza = {
        enable = true;
        icons = true;
        extraOptions = [
          "--group-directories-first"
          "--header"
        ];
      };

      bat = {
        enable = true;
        themes = {
          Catppuccin-mocha = {
            src = pkgs.fetchFromGitHub {
              owner = "catppuccin";
              repo = "bat";
              rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
              sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
            };
            file = "Catppuccin-mocha.tmTheme";
          };
        };
        config = {
          theme = "Catppuccin-mocha";
          pager = "less -FR";
        };
      };

      bottom = {
        enable = true;
        settings = {
          flags.group_processes = true;
          row = [
            {
              ratio = 2;
              child = [
                {type = "cpu";}
                {type = "mem";}
              ];
            }
            {
              ratio = 3;
              child = [
                {
                  type = "proc";
                  ratio = 1;
                  default = true;
                }
              ];
            }
          ];
        };
      };

      thefuck.enable = true;
      ripgrep.enable = true;
      fzf.enable = true;
      lf.enable = true;
    };
}