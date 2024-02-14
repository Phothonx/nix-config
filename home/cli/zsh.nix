{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    history = {
      # path = "${config.xdg.dataHome}/zsh/zsh_history";
      share = true;
      save = 10000;
      size = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignorePatterns = ["rm *" "pkill *" "kill *"];
    };

    dirHashes = {
      docs = "$HOME/Documents";
      dev = "$HOME/Dev";
      dots = "$HOME/.dotfiles";
      dl = "$HOME/Downloads";
      screenshots = "$HOME/Medias/Screenshots";
      media = "$HOME/Medias";
    };

    shellAliases = with pkgs; {
      sudo = "sudo";

      # nixos
      "avaBuild" = "cd ~/.dotfiles && sudo nixos-rebuild switch --flake .#avalon";

      # utils
      cat = "${lib.getExe bat} --style=plain";
      grep = "${lib.getExe ripgrep}";
      cd = "z";
      ls = "${lib.getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
      l = "ls -lF --time-style=long-iso --icons";
      htop = "${lib.getExe bottom}";
      btop = "${lib.getExe bottom}";
      top = "${lib.getExe bottom}";

      # system
      sc = "sudo systemctl";
      jc = "sudo journalctl";
      scu = "systemctl --user ";
      jcu = "journalctl --user";
      la = "${lib.getExe eza} -lah --tree";
      tree = "${lib.getExe eza} --tree --icons --tree";

      # faster navigation
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "......" = "cd ../../../../../";
    };
    shellGlobalAliases = {};

    plugins = with pkgs; [
      {
        name = "zsh-vi-mode";
        src = zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };
}