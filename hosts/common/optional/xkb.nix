{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xkbcomp
    setxkbmap
  ];
  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "nico"; # fr
    variant = "basic";
    options = "caps:escape";
    extraLayouts = {
      nico = {
        description = "My custom xkb layout.";
        languages = ["eng" "fr"];
        symbolsFile = ../kblayouts/symbols/nico;
      };
    };
  };
}
