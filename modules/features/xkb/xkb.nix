{
  flake.nixosModules.xkb = {
    services.xserver.xkb = {
      layout = "ni"; # fr
      variant = "basic";
      options = "caps:escape";
      extraLayouts = {
        nico = {
          description = "My custom xkb layout.";
          languages = ["eng" "fr"];
          symbolsFile = ./nico;
        };
      };
    };
  };
}
