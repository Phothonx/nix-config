{
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        package = pkgs.steam.override { extraEnv.MANGOHUD = true; };
        protontricks.enable = true;
        gamescopeSession.enable = true;
        extest.enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
      };
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
        extraPkgs = pkgs: [
          wineWow64Packages.stable
          winetricks
          vulkan-tools
        ];
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
    ];

    persist.user.directories = [
      ".local/share/Steam"
      ".local/share/osu"
      ".local/share/applications"
      ".local/share/lutris"
      ".config/unity3d"
      ".config/heroic"
      ".steam"
    ];
  };
}
