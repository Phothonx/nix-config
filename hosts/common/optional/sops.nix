{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  environment.systemPackages = [
    pkgs.age
    pkgs.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/nico/.config/sops/age/keys.txt";
    secrets = {
      "user_passwords/nico" = { neededForUsers = true; };
      "user_passwords/guest" = { neededForUsers = true; };
      "wifi_config" = {};
    };
  };
}
