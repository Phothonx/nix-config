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
      self.nixosModules.librewolf
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
    # indexed search in nautilus (otherwise it crawls the disk on every search)
    services.gnome.localsearch.enable = true;
    services.gnome.tinysparql.enable = true;
    environment.systemPackages = [
      pkgs.nautilus

      pkgs.bibata-cursors
      self.packages.${system}.noctalia
      self.packages.${system}.kitty
    ];

    # Secret Service provider: spotifast (and others) refuse to remember
    # sign-ins without one. greetd autologs in, so the login keyring is not
    # unlocked by PAM — give it an empty password on first prompt (disk is LUKS).
    services.gnome.gnome-keyring.enable = true;
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
      # per-folder view/sort/zoom (gvfsd-metadata)
      ".local/share/gvfs-metadata"
      # localsearch index: without it the whole home is re-crawled every boot
      ".cache/tracker3"
      # xdg-permission-store: portal grants, incl. screencast "remember" tokens
      ".local/share/flatpak/db"
      ".local/share/keyrings"
    ];
  };
}
