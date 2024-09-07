{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.user;
  mkOpt = type: default: description:
    mkOption { inherit type default description; };
in {
  options.user = with types; {
    name = mkOpt str "phothonx" "Account username";
    fullName = mkOpt str "Phothonx" "Full user name";
    email = mkOpt str "" "Self-explainatory";
    hashedPasswordFile = mkOpt str "password" "Self-explainatory";
    # icon = mkOpt (nullOr package) defaultIcon "Profile picture";
    # prompt-init = mkBoolOpt true "Initial shell on opening";
    extraGroups = mkOpt (listOf str) [ ] "Groups assignation";
    extraOptions = mkOpt attrs { } (mdDoc "Extra options passed to `users.users.<name>`");
  };

  config = {
    users.users.${cfg.name} = {
      isNormalUser = true;
      description = cfg.fullName;
      inherit (cfg) name hashedPasswordFile extraGroups;
      home = "/home/${cfg.name}";
      group = "users";
      # shell = pkgs.zsh;
    } // cfg.extraOptions;

    users.mutableUsers = false;
  };
}
