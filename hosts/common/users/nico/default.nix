{
  inputs,
  outputs,
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;

  users.users.nico = {
    shell = pkgs.bashInteractive;
    hashedPasswordFile = config.sops.secrets."user_passwords/nico".path;
    isNormalUser = true;
    home = "/home/nico";
    group = "users";
    extraGroups = ifTheyExist [
      "audio"
      "network"
      "video"
      "gamemode"
      "wheel"
      "networkmanager"
      "adbuser"
    ];
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    verbose = true;
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "hm.back";
    extraSpecialArgs = {inherit inputs outputs;};
    users.nico = import ./../../../../home/nico;
  };
}
