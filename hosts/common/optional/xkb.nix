{pkgs, ...}: {
  environment.systemPackages = [ pkgs.xorg.xkbcomp ];

  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "fr";
    options = "caps:escape";
    extraLayouts = {
      us-nico = {
        description = "My custom xkb layout.";
        languages = [ "eng" "fr" ];
        symbolsFile = ../kblayouts/us-nico/symbols;
      };
    };
  };
}
