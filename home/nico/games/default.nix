{pkgs, ...}: {
  home.packages = with pkgs; [
    mindustry-wayland
    osu-lazer-bin
  ];
}
