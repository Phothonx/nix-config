{inputs, ...}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
    raspberry-pi-3

    ./../common/global
    ./../common/optional/agenix.nix
    ./../common/optional/networking.nix
    ./../common/optional/systemd-boot.nix
  ];

  # === DO NOT TOUCH ! ===
  system.stateVersion = "XXXX";
}
