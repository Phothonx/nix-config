{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
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
  };

  config = {
    environment.sessionVariables = {
      SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
      SOPS_AGE_SSH_PRIVATE_KEY_FILE = builtins.concatStringsSep ":" config.sops.age.sshKeyPaths;
    };
  };
}
