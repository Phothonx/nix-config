{
  flake.nixosModules.obs = {pkgs, ...}: {

    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio.override {cudaSupport = true;};
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
