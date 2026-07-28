{
  flake.nixosModules.syncthing = {config, ...}: let
    user = "nico";
    home = "/home/${user}";
  in {
    age.secrets.syncthing-gui-pw = {
      file = ../../../secrets/selfhosted/syncthing-gui-pw.age;
      owner = user;
    };

    services.syncthing = {
      enable = true;
      inherit user;
      group = "users";
      dataDir = "${home}/.local/share/syncthing";
      configDir = "${home}/.config/syncthing";
      openDefaultPorts = true; # 22000/tcp+udp (sync), 21027/udp (discovery)

      # GUI login (see header). Password comes from the secret; username here.
      guiPasswordFile = config.age.secrets.syncthing-gui-pw.path;
      settings.gui.user = user;

      # GUI-managed devices/folders (see header): do NOT let a rebuild wipe them.
      overrideDevices = false;
      overrideFolders = false;
    };

    # The synced dirs (Documents, Pictures, …) are already persisted by the
    # impermanence defaults; only Syncthing's own state needs adding.
    persist.user.directories = [
      ".config/syncthing"
      ".local/share/syncthing"
    ];
  };
}
