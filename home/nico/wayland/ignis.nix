{inputs, pkgs, ...}: {
  imports = [ inputs.ignis.homeManagerModules.default ];

  programs.ignis = {
    enable = true;
    addToPythonEnv = true;
    configDir = ./ignis;

    services = {
      bluetooth.enable = true;
      recorder.enable = true;
      audio.enable = true;
      network.enable = true;
    };

    sass = {
      enable = true;
      useDartSass = true;
    };

    extraPackages = with pkgs; [
    ];
  };
}
