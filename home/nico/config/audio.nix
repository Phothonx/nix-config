{pkgs, ...}: {
  services.easyeffects = {
    # enable = true;
    preset = "";
    extraPresets = {
    };
  };

  home.packages = with pkgs; [
    pavucontrol
    helvum
  ];
}
