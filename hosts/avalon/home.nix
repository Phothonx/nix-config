{inputs, ...}: {
  # Wayland
  wayland.windowManager.hyprland.enable = true;
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprshade.enable = true;
  programs.tofi.enable = true;

  # Sofwares
  desktopApps.enable = true;
  programs.kitty.enable = true;
  programs.spicetify.enable = true;
  programs.firefox.enable = true;
  programs.firefox.theme.enable = true;
  programs.firefox.arkenfox.enable = true;
  programs.vesktop.enable = true;

  # Services
  services.polkit.enable = true;
  services.hypridle.enable = true;
  services.clipboard.enable = true;
  services.dunst.enable = true;

  # Dev
  programs.neovim.enable = true;
  # programs.vscode.enable = true;
  nix.registry.dev.flake = inputs.nix-profile-devshells;

  # Config
  xdg.enable = true;
  theme.enable = true;
  qt.enable = true;
  gtk.enable = true;

  # Cli
  cli.tools.enable = true;
  cli.fun.enable = true;
  cli.qof.enable = true;
  programs.git.enable = true;
  programs.cava.enable = true;
  programs.eza.enable = true;
  programs.zoxide.enable = true;
  programs.starship.enable = true;
  programs.btop.enable = true;
  # programs.bash.enable = true;
  programs.fish.enable = true;
}
