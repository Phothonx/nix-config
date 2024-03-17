{ lib, pkgs, config, ... }:
{
  programs.zsh = {
    shellAliases = with pkgs; with lib; {
      sudo = "sudo ";

      # utils
      cat = "${getExe bat} --style=plain";
      grep = getExe ripgrep;
      cd = "z";
      ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
      l = "ls -lF --time-style=long-iso --icons";
      htop = getExe bottom;
      btop = getExe bottom;

      # Nvchad
      nv = "nvim";
      nvchad = "nvim";

      # system
      sc = "sudo systemctl";
      jc = "sudo journalctl";
      scu = "systemctl --user ";
      jcu = "journalctl --user";
      la = "${getExe eza} -lah --tree";
      tree = "${getExe eza} --tree --icons --tree";
      kys = "shutdown now";

      # faster navigation
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "......" = "cd ../../../../../";
    };

    shellGlobalAliases = {};
 };
}