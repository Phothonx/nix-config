{self, ...}: {
  flake.nixosModules.obs = {pkgs, ...}: {
    # imports = [
    #   self.nixosModules.impermanence
    # ];

    programs.obs-studio = {
      enable = true;
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
