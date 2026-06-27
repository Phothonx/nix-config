{
  flake.nixosModules.obs = {pkgs, ...}: {
    programs.obs-studio = {
      enable = true;
      # NVENC recording works without cudaSupport; enabling it forces obs to
      # build from source and pulls in the CUDA toolkit. Use the cached build.
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        input-overlay
        obs-vkcapture
      ];
    };

    persist.user.directories = [
      ".config/obs-studio"
    ];
  };
}
