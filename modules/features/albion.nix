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
              # dlopen'd by NSS inside the launcher's Qt WebEngine; ".out" is
              # required since sqlite only installs its bin/man outputs.
              sqlite.out
            ]);

          # The launcher's Qt WebEngine can't bring up its Chromium GPU process
          # inside the bubblewrap sandbox ("Failed to send
          # GpuControl.CreateCommandBuffer"). Only the launcher's web view is
          # affected — the game itself is a separate Unity binary.
          profile = ''
            export FHS=1
            export QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu"
          '';
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
