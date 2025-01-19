{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.bash;
in {
  config = mkIf cfg.enable {
    # <3 https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
    programs.bash = {
      historyControl = [
        "ignoredups"
        "ignorespace"
      ];

      bashrcExtra = builtins.readFile ./bashrc;
    };
  };
}
