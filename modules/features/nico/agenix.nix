{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.nico = {pkgs, ...}: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    imports = [inputs.agenix.nixosModules.default];

    environment.systemPackages = [
      inputs.agenix.packages.${system}.default
      self.packages.${system}.git
    ];

    # Decrypt with the machine's own host key first (works at boot, independent of
    # the user's key), falling back to nico's key for user-targeted secrets.
    age.identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/persist/home/nico/.ssh/id_ed25519"
    ];

    age.secrets = {
      psswd_nico.file = ../../../secrets/user/psswd_nico.age;

      github_config = {
        file = ../../../secrets/user/github_config.age;
        path = "/home/nico/.config/git/github_config";
        mode = "0644";
      };
      thor_config = {
        file = ../../../secrets/user/thor_config.age;
        path = "/home/nico/.config/git/thor_config";
        mode = "0644";
      };
      codeberg_config = {
        file = ../../../secrets/user/codeberg_config.age;
        path = "/home/nico/.config/git/codeberg_config";
        mode = "0644";
      };

      # One SSH key per machine: ~/.ssh/id_ed25519, generated locally and kept in
      # /persist (never in this repo). Its public key is registered on each
      # service; the config below needs no per-host IdentityFile.
      ssh_config = {
        file = ../../../secrets/user/ssh_config.age;
        path = "/home/nico/.ssh/config";
        owner = "nico";
        group = "users";
        mode = "0600";
      };
    };
  };
}
