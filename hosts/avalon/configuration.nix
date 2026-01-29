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

  services.pipewire.extraConfig.pipewire."99-parametric-eq" = {
    "context.modules" = [
      {
        name = "libpipewire-module-parametric-equalizer";
        args = {
          "equalizer.filepath" = ./pipewire/fiio-ft1-pro-parametric-eq.txt;
          equalizer.description = "Parametric EQ Sink for fiio ft1 pro";
          "capture.props" = {
            "node.name" = "Parametric EQ input for fiio ft1 pro";
          };
          "playback.props" = {
            "node.name" = "Parametric EQ output for fiio ft1 pro";
          };
        };
      }
    ];
  };

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
