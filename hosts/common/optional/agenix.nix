{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.agenix.nixosModules.default ];
  environment.systemPackages = [ inputs.agenix.packages.${pkgs.system}.default ];

  age.secrets.system-password.file = ./../../../secrets/system-password.age;
  age.secrets.git-config.file = ./../../../secrets/git-config.age;
  age.secrets.ssh-config.file = ./../../../secrets/ssh-config.age;

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
    "/home/nico/.ssh/id_ed25519"
  ];
}
