{ pkgs, inputs, systemConfig, userConfig, ... }:
{
  users.users.${userConfig.userName} = {
    isNormalUser = true;
    description = userConfig.name;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.nushell;
  };

  # environment.pathsToLink = [ "/share/bash-completion" ]; # for bash autocompletion

  imports = [ inputs.home-manager.nixosModules.home-manager ];

home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
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
