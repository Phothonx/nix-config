{...}: {
  flake.nixosModules.xdg = {pkgs, ...}: {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };

    xdg.icons.fallbackCursorThemes = [ "Bibata-Modern-Ice" ];

    environment.systemPackages = with pkgs; [
      bibata-cursors
      xdg-utils
      xdg-ninja
    ];
  };
}
