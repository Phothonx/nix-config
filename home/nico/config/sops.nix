
{ inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/nico/.config/sops/age/keys.txt";
    secrets = {
      "configs/ssh" = {};
      "configs/git" = {};
    };
  };
}
