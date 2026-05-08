{inputs, ...}: {
  # nuke my root :)
  flake.nixosModules.impermanence = {...}: {
    imports = [
      inputs.impermanence.nixosModules.impermanence
    ];

    environment.persistence."/persist" = {
      enable = true;
      hideMounts = true;
      directories = [
        "/etc/nixos"
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        "/etc/NetworkManager/system-connections"
        "/var/lib/NetworkManager"
        "/etc/ssh"

        "/var/lib/postgresql" # immich
        "/var/lib/immich"
      ];
      files = [
        "/etc/machine-id"
        # "/etc/ssh/ssh_host_ed25519_key"
        # "/etc/ssh/ssh_host_ed25519_key.pub"
      ];
    };

    fileSystems."/persist".neededForBoot = true;
  };
}
