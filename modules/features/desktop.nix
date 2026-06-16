{self, ...}: {
  flake.nixosModules.desktop = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.pipewire
      self.nixosModules.firefox
      self.nixosModules.xkb
      self.nixosModules.xdg
      self.nixosModules.gtk
    ];

    # systemd.user.services.noctalia = {
    #   description = "Noctalia";
    #   after = [ "graphical-session.target" ];
    #   partOf = [ "graphical-session.target" ];
    #   wantedBy = [ "graphical-session.target" ];
    #
    #   serviceConfig = {
    #     ExecStart = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
    #     Restart = "on-failure";
    #     RestartSec = "2";
    #   };
    # };

    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };

    services.udisks2.enable = true; # nautilus
    services.gvfs.enable = true; # nautilus
    environment.systemPackages = [
      pkgs.nautilus

      pkgs.bibata-cursors
      self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
      self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
    ];

    services.gnome.gnome-keyring.enable = lib.mkForce false;
    security.polkit.enable = true;

    persist.user.directories = [
      ".cache/noctalia"
      ".local/share/nautilus"
      ".config/nautilus"
    ];
  };
}
