{ lib, pkgs, config, ... }:
let
  neovimWrapped = pkgs.writeShellScriptBin "neovimWrapped" ''
    if true 
    then
      kitty @ set-spacing padding=0
      kitty @ set-font-size 13
      nvim $*
      kitty @ set-font-size 15
      kitty @ set-spacing padding=default
    else
      nvim $*
    fi
  ''; # TODO finish the shellscript !
in
{
  programs.zsh = {
    shellAliases = with pkgs; with lib; {
      sudo = "sudo ";

      # Nixos

      # utils
      cat = "${getExe bat} --style=plain";
      grep = getExe ripgrep;
      cd = "z";
      ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
      l = "ls -laF --time-style=long-iso --icons";
      htop = getExe bottom;
      btop = getExe bottom;

      # Nvchad
      nv= lib.getExe neovimWrapped;

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
