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

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.generateKey = true;
    age.keyFile = "/var/lib/sops-nix/key.txt";

    secrets = {
      "user_passwords/nico" = { neededForUsers = true; };
      "user_passwords/guest" = { neededForUsers = true; };
      "wifi_config" = {};
    };
  };
}
