{ config, lib, unstable, inputs, ... }:
with lib;
let
  cfg = config.user.home-manager;
  userName = config.user.name;
  mkOpt = type: default: description:
    mkOption { inherit type default description; };
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.user.home-manager = with types; {
    enable = mkEnableOption "Enable homemanager";
    stateVersion = mkOpt str "23.11" "home-manager stateVersion";
    imports = mkOpt (listOf path) [] "additional home-manager modules";
  };

  config = mkIf cfg.enable {
    home-manager = {
      verbose = true;
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "hm.old";
      extraSpecialArgs = { inherit inputs unstable; };

      users.${userName} = {
        imports = [ ./../../home ] ++ cfg.imports;
        home.username = userName;
        home.homeDirectory = "/home/${userName}";
        home.stateVersion = cfg.stateVersion;
        programs.home-manager.enable = true;
      };
    };
  };
}
