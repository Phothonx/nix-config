{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  config = {
    environment.systemPackages = [
      pkgs.age
      pkgs.sops
    ];

    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      age.generateKey = true;
      age.keyFile = "/var/lib/sops-nix/key.txt";
    };

    environment.sessionVariables = {
      SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
      SOPS_AGE_SSH_PRIVATE_KEY_FILE = builtins.concatStringsSep ":" config.sops.age.sshKeyPaths;
    };
  };
}
