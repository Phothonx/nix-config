{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  config = {
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.sshKeyPaths = ["/home/nico/.ssh/id_ed25519"];
      age.generateKey = true;
      age.keyFile = "/home/nico/.config/sops/age/key.txt";
    };

    home.sessionVariables = {
      SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
      SOPS_AGE_SSH_PRIVATE_KEY_FILE = builtins.concatStringsSep ":" config.sops.age.sshKeyPaths;
    };
  };
}
