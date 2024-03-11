{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      zip
      unzip
      fd
      neovim

      duf
      yt-dlp
      cfspeedtest
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
        config = {
          theme = "base16";
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

      cava = {
        enable = true;
        settings = {

        };
      };

      thefuck.enable = true;
      ripgrep.enable = true;
      fzf.enable = true;
      lf.enable = true;
  };
}
