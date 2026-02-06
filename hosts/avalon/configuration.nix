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
          "node.description" = "Parametric EQ for fiio ft1 pro";
          "media.name" = "Parametric EQ for fiio ft1 pro";
          "equalizer.filepath" = ./pipewire/fiio-ft1-pro-parametric-eq.txt;
          "audio.channels" = 2;
          "audio.position" = ["FL" "FR"];
          "capture.props" = {
            "node.name" = "parametric-eq-input-fiio-ft1-pro";
            "node.description" = "Parametric EQ Input for fiio ft1 pro";
            "audio.channels" = 2;
            "audio.position" = ["FL" "FR"];
            "media.class" = "Audio/Sink";
          };
          "playback.props" = {
            "node.name" = "parametric-eq-output-fiio-ft1-pro";
            "node.description" = "Parametric EQ Output for fiio ft1 pro";
            "audio.channels" = 2;
            "audio.position" = ["FL" "FR"];
            "node.target" = "alsa_output.usb-FiiO*";
            "node.passive" = true;
          };
        };
      }
    ];
  };
  programs.noisetorch.enable = true;

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
