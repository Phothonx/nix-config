{
  flake.nixosModules.albion = {pkgs, ...}: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-pipewire-audio-capture
          input-overlay
        ];
      };
    };

    environment.systemPackages = with pkgs; [
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
      ".local/share/applications"
      ".local/share/vulkan"
      ".config/obs-studio"
      ".config/unity3d/"
    ];
  };
}
