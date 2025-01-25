{outputs, ...}: {
  imports = [
    outputs.homeManagerModules.colors
    outputs.homeManagerModules.cursor
    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.icons
    outputs.homeManagerModules.wallpaper
    outputs.homeManagerModules.monitors
  ];

  fontsProfiles.enable = true;

  wallpaper = ./../../../wallpapers/magma.png;
  lockimg = ./../../../wallpapers/magma.png;
}
