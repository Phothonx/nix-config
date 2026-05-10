{self, ...}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    # imports = [
    #   self.nixosModules.impermanence
    # ];

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        package = pkgs.steam.override {
          extraEnv = {
            MANGOHUD = true;
            OBS_VKCAPTURE = true;
          };
        };
        protontricks.enable = true;
        gamescopeSession.enable = true;
        extest.enable = true;
        remotePlay.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        extraCompatPackages = with pkgs; [proton-ge-bin];
      };
    };

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      MANGOHUD_CONFIG = "control=mangohud,legacy_layout=0,horizontal,battery,time,time_format=%H\\:%M,gpu_stats,gpu_power,cpu_stats,ram,vram,fps,frametime=1,frame_timing=1,hud_no_margin,table_columns=14";
      GAMESCOPE_WSI = "wayland";
    };

    environment.systemPackages = with pkgs; [
      (lutris.override {
        # List of additional system libraries
        extraLibraries = pkgs: [
          krb5
          libxau
          libxdmcp
          libglvnd # GLVND dispatcher (provides EGL/GLX)
          mesa # fallback GL, needed for Xwayland glamor
          vulkan-loader # Vulkan ICD loader
        ];
        # List of additional system packages
        extraPkgs = pkgs: [];
      })
      heroic
      protonup-qt
      # bottles
      # steamtinkerlaunch

      steam-run
      # dxvk
      # parsec-bin

      mangohud

      osu-lazer-bin
      # mindustry-wayland
      # atlauncher
      # prismlauncher

      (pkgs.buildFHSEnv (pkgs.appimageTools.defaultFhsEnvArgs
        // {
          name = "fhs-albion";
          targetPkgs = pkgs:
            (pkgs.appimageTools.defaultFhsEnvArgs.targetPkgs pkgs)
            ++ (with pkgs; [
              krb5
              libxau
              libxdmcp

              libglvnd # GLVND dispatcher (provides EGL/GLX)
              mesa # fallback GL, needed for Xwayland glamor
              vulkan-loader # Vulkan ICD loader
            ]);
          profile = ''
            export FHS=1
          '';
          runScript = "fish";
        }))
    ];

    persist.user.directories = [
      ".local/share/Steam"
      ".local/share/osu"
      ".local/share/albiononline"
      ".local/share/lutris"
      ".config/unity3d"
      ".config/heroic"
    ];
  };
}
