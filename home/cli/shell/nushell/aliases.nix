{ lib, pkgs, ... }:
let
  noPad = exec: (lib.getExe (pkgs.writeShellScriptBin "noPad" ''
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
  ''));
in
{
  home.sessionVariables = {
    EDITOR = noPad "nvim";
    VISUAL = noPad "nvim";
  };

  programs.nushell.shellAliases = with pkgs; with lib; {
    # Git
    ga = "git add";
    gc = "git commit";
    gd = "git diff";
    gl = "git log";
    gs = "git status";
    gp = "git push -u origin main";

    # Nixos
    ns = "nh os switch";
    nt = "nh os test";
    nc = "nix flake check $env.FLAKE --show-trace";
    nd = "nix develop -c $env.SHELL";

    # Replacements
    htop = noPad "${getExe bottom} -b";
    btm = noPad bottom;
    cat = getExe bat;
    grep = getExe ripgrep;
    find = getExe fd;
    df = getExe duf;
    cd = "z";

    # Utils
    la = "ls -la";
    l = "ls -l";
    tree = "${getExe eza} --tree --icons --tree";

    # Neovim
    nvim = noPad "nvim";
    nv = noPad "nvim";

    # System
    sc = "sudo systemctl";
    jc = "sudo journalctl";
    scu = "systemctl --user";
    jcu = "journalctl --user";
    kys = "shutdown now";

    # Fun
    cbonsai = noPad "${getExe cbonsai} -l -i -L 50";
    pipes = noPad "${getExe pipes} -R -p 3 -t 1";
    cava = noPad cava;
    ni = getExe nitch;

    # Navigation
    ".." = "cd ..";
    "..." = "cd ../../";
    "...." = "cd ../../../";
    "....." = "cd ../../../../";
    "......" = "cd ../../../../../";
 };
}
