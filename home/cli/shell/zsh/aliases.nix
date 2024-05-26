{ lib, pkgs, config, ... }:
let
  noPad = exec: (pkgs.writeShellScriptBin "noPad" ''
    if echo $TERM | ${lib.getExe pkgs.ripgrep} kitty -q
      then
      kitty @ set-spacing padding=0
      kitty @ set-font-size 13
      ${exec} $*
      kitty @ set-font-size 15
      kitty @ set-spacing padding=default
    else
      ${exec} $*
    fi
  '');
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
      ranger = getExe (noPad (getExe ranger));
      ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
      l = "ls -laF --time-style=long-iso --icons";

      # Neovim
      nvim = getExe (noPad "nvim");
      nv = getExe (noPad "nvim");

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

      # lol
      htop = getExe (noPad "${getExe bottom} -b");
      btm = getExe (noPad (getExe bottom));
      btop = getExe (noPad (getExe bottom));
      cbonsai = getExe (noPad "${getExe cbonsai} -l -i -L 50");
      "pipes.sh" = getExe (noPad "${getExe pipes} -R -p 3 -t 1");
      cava = getExe (noPad "${getExe cava}");
    };

    shellGlobalAliases = {};
 };
}
