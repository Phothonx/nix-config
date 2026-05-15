{
  flake.nixosModules.gaming = {pkgs, ...}: {

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
      GAMESCOPE_WSI = "wayland";
    };

    environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          krb5
          libxau
          libxdmcp
        ]
        ++ (pkgs.appimageTools.defaultFhsEnvArgs.targetPkgs pkgs)
        ++ (pkgs.appimageTools.defaultFhsEnvArgs.multiPkgs pkgs);
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
              zstd
            ]);

          profile = ''export FHS=1'';
          runScript = "fish";
        }))
    ];

    persist.user.directories = [
      ".local/share/Steam"
      ".local/share/osu"
      ".local/share/applications"
      ".local/share/lutris"
      ".config/unity3d"
      ".config/heroic"
    ];
  };
}
