
{ config, inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  options = {
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.sshKeyPaths = [ "/home/nico/.ssh/id_ed25519" ];
      age.generateKey = true;
      age.keyFile = "/home/nico/.config/sops/age/key.txt";

      secrets = {
        "ssh/github" = { sopsFile = ../../../secrets/keys.yaml; };
        "ssh/codeberg" = { sopsFile = ../../../secrets/keys.yaml; };
        "ssh/thor" = { sopsFile = ../../../secrets/keys.yaml; };
        "ssh/enseirb" = { sopsFile = ../../../secrets/keys.yaml; };
        "ssh/crystal" = { sopsFile = ../../../secrets/keys.yaml; };
      };
    };
  };

  config = {
    home.sessionVariables = {
      SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
      SOPS_AGE_SSH_PRIVATE_KEY_FILE = builtins.concatStringsSep ":" config.sops.age.sshKeyPaths;
    };
  };
}
