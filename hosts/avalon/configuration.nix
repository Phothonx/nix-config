{inputs, ...}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
    common-pc-ssd
    common-cpu-intel
    ./../common/global # default.nix import all
    ./../common/optional # default.nix import all

    ./../common/users/nico
  ];

  services.logind = {
    settings.Login = {
      HandlePowerKey = "suspend";
    };
  };

  # to detect mouse keybr at startup
  boot.initrd.availableKernelModules = ["hid_cherry"];

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 1024;
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 2048;
    };
  };

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
