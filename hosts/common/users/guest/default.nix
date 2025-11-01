{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;

  sops.secrets."user_passwords/guest" = {neededForUsers = true;};

  users.users.guest = {
    shell = pkgs.bashInteractive;
    hashedPasswordFile = config.sops.secrets."user_passwords/guest".path;
    isNormalUser = true;
    home = "/home/guest";
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

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP+aoYPpPe5qKS56gkliK9FuX+uiNJN2iug7cqT7Y9I5 nico@avalon"
    ];
  };
}
