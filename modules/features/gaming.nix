# World of Warcraft (Battle.net) through Lutris; everything else is commented out.
#
# Install: Lutris -> search "Battle.net" -> official install script, prefix in
# ~/Games/battlenet (~/Games is persisted by impermanence.nix). Lutris fetches
# its own Wine/Proton runners and DXVK. In game, prefer DirectX 11 (DXVK) on
# the Intel iGPU and launch through gamemode (Lutris: System options ->
# "Enable Feral GameMode"); mangohud shows fps.
# 32-bit graphics drivers come from hardware.graphics.enable32Bit (avalon).
{
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs = {
      gamemode.enable = true;
      # gamescope.enable = true;
      # steam = {
      #   enable = true;
      #   package = pkgs.steam.override {extraEnv.MANGOHUD = true;};
      #   protontricks.enable = true;
      #   gamescopeSession.enable = true;
      #   extest.enable = true;
      #   extraCompatPackages = with pkgs; [proton-ge-bin];
      # };
    };

    environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs:
          [
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
      # heroic
      # protonup-qt
      # xonotic
      # bottles
      # steamtinkerlaunch

      # steam-run
      # wineWow64Packages.stable
      # winetricks
      # dxvk
      # parsec-bin

      mangohud

      # osu-lazer-bin
      # mindustry-wayland
      # atlauncher
      # prismlauncher
    ];

    persist.user.directories = [
      ".local/share/lutris" # library db, runners, DXVK versions
      ".config/lutris" # game configs, runner settings
      ".local/share/umu" # Proton runtime used by Lutris' umu runners (~1 GB)
      # GE-Proton downloaded by Lutris; the prefix's system32 links into it, so
      # losing it on reboot breaks the prefix (wine: failed to open umu.exe)
      ".local/share/Steam/compatibilitytools.d"

      # ".local/share/Steam"
      # ".local/share/osu"
      # ".local/share/aspyr-media"
      # ".config/heroic"
      # ".steam"

      # already persisted by albion.nix (a duplicate fails the build):
      # ".local/share/applications"
      # ".local/share/vulkan"
      # ".config/unity3d"
    ];
  };
}
