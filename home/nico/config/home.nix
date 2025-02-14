{
  outputs,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.colors
    outputs.homeManagerModules.cursor
    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.icons
    outputs.homeManagerModules.wallpaper
    outputs.homeManagerModules.monitors
  ];

  home.packages = with pkgs; [
  ];

  fontsProfiles.enable = true;

  wallpaper = ./../../../wallpapers/magma.png;
  lockimg = ./../../../wallpapers/magma.png;
}
