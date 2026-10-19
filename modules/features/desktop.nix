{self, ...}: {
  flake.nixosModules.desktop = {
    pkgs,
    lib,
    ...
  }: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    imports = [
      self.nixosModules.pipewire
      self.nixosModules.firefox
      self.nixosModules.xkb
      self.nixosModules.xdg
      self.nixosModules.gtk
    ];

    programs.niri = {
      enable = true;
      package = self.packages.${system}.niri;
    };

    services.udisks2.enable = true; # nautilus
    services.gvfs.enable = true; # nautilus
    environment.systemPackages = [
      pkgs.nautilus

      pkgs.bibata-cursors
      self.packages.${system}.noctalia
      self.packages.${system}.kitty
    ];

    services.gnome.gnome-keyring.enable = lib.mkForce false;
    security.polkit.enable = true;

    systemd.user.services.lock-before-sleep = {
      description = "Lock screen before sleep";
      before = ["sleep.target"];
      wantedBy = ["sleep.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${lib.getExe self.packages.${system}.noctalia} ipc call lockScreen lock";
        RemainAfterExit = true;
      };
    };

    persist.user.directories = [
      ".cache/noctalia"
      ".local/share/nautilus"
      ".config/nautilus"
      # nautilus sidebar bookmarks
      ".config/gtk-3.0"
      # nautilus view/sort prefs (user dconf db, layered over the system one)
      ".config/dconf"
      # xdg-permission-store: portal grants, incl. screencast "remember" tokens
      ".local/share/flatpak/db"
    ];
  };
}
