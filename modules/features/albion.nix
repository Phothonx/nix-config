{
  flake.nixosModules.albion = {pkgs, ...}: let
    fhs-albion = pkgs.buildFHSEnv (pkgs.appimageTools.defaultFhsEnvArgs
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
            # needed by the launcher's bundled libgcrypt (Qt, dbus, systemd)
            libgpg-error
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
      });

    # Official launcher (~/Games/albion-online, from the Linux installer). Its
    # script backgrounds the launcher and exits; that's fine here since
    # buildFHSEnv doesn't unshare PIDs, so the detached launcher (and its
    # self-update -> relaunch chain) outlives the script.
    albion-online = pkgs.writeShellScriptBin "albion-online" ''
      exec ${fhs-albion}/bin/fhs-albion -c "$HOME/Games/albion-online/Albion-Online"
    '';
  in {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
    };

    environment.systemPackages = [
      fhs-albion
      albion-online
    ];

    persist.user.directories = [
      ".local/share/applications"
      ".local/share/vulkan"
      ".config/unity3d/"
    ];
  };
}
