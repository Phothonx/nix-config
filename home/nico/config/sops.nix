
{ inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.sshKeyPaths = [ "/home/nico/.ssh/id_ed25519" ];
    age.generateKey = true;
    age.keyFile = "/home/nico/.config/sops/age/keys.txt";

    secrets = {
      "ssh/github" = { sopsFile = ../../../secrets/keys.yaml; };
      "ssh/codeberg" = { sopsFile = ../../../secrets/keys.yaml; };
      "ssh/thor" = { sopsFile = ../../../secrets/keys.yaml; };
      "ssh/enseirb" = { sopsFile = ../../../secrets/keys.yaml; };
      "ssh/crystal" = { sopsFile = ../../../secrets/keys.yaml; };
    };
  };
}
