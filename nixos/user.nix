{ pkgs, inputs, systemConfig, userConfig, ... }:
{
    users.users.${userConfig.userName} = {
    isNormalUser = true;
    description = userConfig.name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "old";
    extraSpecialArgs = { inherit inputs systemConfig userConfig; };
    users.${userConfig.userName} = {
      imports = [ ./../home ];
      home.username = userConfig.userName;
      home.homeDirectory = "/home/${userConfig.userName}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };
}
