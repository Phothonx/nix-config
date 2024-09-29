{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.bash;
in {
  config = mkIf cfg.enable {
    programs.bash = {
      historyFile = "${config.xdg.stateHome}/bash/history";
      shellAliases = with pkgs; {
        # Utils
        la = "ls -la";
        l = "ls -l";
        tree = "${getExe eza} --tree --icons --tree";

        # Neovim
        nv = "nvim";

        # System
        sc = "sudo systemctl";
        jc = "sudo journalctl";
        scu = "systemctl --user";
        jcu = "journalctl --user";
        kys = "shutdown now";

        # Navigation
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
      };
    };
  };
}
