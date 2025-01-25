{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.agenix.nixosModules.default];
  environment.systemPackages = [inputs.agenix.packages.${pkgs.system}.default];

  age.secrets.secret1.file = ./../../../secrets/secret1.age;
  age.secrets.secret2.file = ./../../../secrets/secret2.age;

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/home/nico/.ssh/id_ed25519"
  ];
}
