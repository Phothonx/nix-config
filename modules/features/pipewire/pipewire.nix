{
  flake.nixosModules.pipewire = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      pavucontrol
      crosspipe
    ];

    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    # holy grail: nix shell nixpkgs#ladspa-sdk nixpkgs#rnnoise-plugin -c analyseplugin $(nix eval --raw nixpkgs#rnnoise-plugin.outPath)/lib/ladspa/librnnoise_ladspa.so

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;

      extraLadspaPackages = [
        pkgs.rnnoise-plugin
      ];

      extraConfig.pipewire = {
        "99-lowlatency" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 1024;
            "default.clock.min-quantum" = 32;
            "default.clock.max-quantum" = 2048;
          };
        };

        "99-input-denoising"."context.modules" = [
          {
            name = "libpipewire-module-filter-chain";
            args = {
              "node.description" = "Noise Treatment source";
              "filter.graph" = {
                nodes = [
                  {
                    type = "ladspa";
                    name = "rnnoise";
                    plugin = "librnnoise_ladspa";
                    label = "noise_suppressor_mono";
                    control = {
                      "VAD Threshold (%)" = 93.0;
                      "VAD Grace Period (ms)" = 200;
                      "Retroactive VAD Grace (ms)" = 0;
                    };
                  }
                  {
                    type = "builtin";
                    name = "micgain";
                    label = "linear";
                    control = {
                      "Mult" = 2.3;
                    };
                  }
                ];
                links = [
                  {
                    output = "rnnoise:Output";
                    input = "micgain:In";
                  }
                ];
                inputs = ["rnnoise:Input"];
                outputs = ["micgain:Out"];
              };
              "capture.props" = {
                "node.name" = "capture.rnnoise_source";
                "node.passive" = true;
                "node.dont-fallback" = true;
                "audio.rate" = 48000;
              };
              "playback.props" = {
                "node.name" = "rnnoise_source";
                "media.class" = "Audio/Source";
                "audio.rate" = 48000;
                "priority.session" = 2000;
              };
            };
          }
        ];

        "99-parametric-eq"."context.modules" = [
          {
            name = "libpipewire-module-parametric-equalizer";
            args = {
              "node.description" = "Parametric EQ for fiio ft1 pro";
              "equalizer.filepath" = ./fiio-ft1-pro-parametric-eq.txt;
              "capture.props" = {
                "node.name" = "eq_input.fiio_ft1_pro";
                "media.class" = "Audio/Sink";
                "audio.channels" = 2;
                "audio.position" = ["FL" "FR"];
                "audio.rate" = 48000;
                "priority.session" = 2000;
              };
              "playback.props" = {
                "node.name" = "eq_output.fiio_ft1_pro";
                "node.passive" = true;
                "node.dont-fallback" = true;
                # "target.object" = "alsa_output.usb-FIIO_FIIO_KA13-01.analog-stereo";
                "audio.channels" = 2;
                "audio.position" = ["FL" "FR"];
                "audio.rate" = 48000;
              };
            };
          }
        ];
      };
    };

    persist.user.directories = [
      ".local/state/wireplumber"
    ];
  };
}
