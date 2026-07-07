# Personal home-data sync + backup.
#
# Syncthing (peer-to-peer, TLS 1.3 transport) replicates your personal home
# directories between devices, with camlann as an always-on backup peer. It has
# no server role — every peer runs the same daemon.
#
# This is independent of the `vault` feature: the gocryptfs vault simply lives
# inside Documents, so it rides along on this sync like any other file.
{
  flake.nixosModules.syncthing = {lib, ...}: let
    user = "nico";
    home = "/home/${user}";

    # Home subdirectories to sync/back up; each becomes its own Syncthing folder
    # shared with every device below. Kept to real personal data on purpose —
    # syncing dotfiles/caches/Steam/Games across machines is more grief than
    # it's worth. Add/remove a line to change what's backed up.
    syncedDirs = [
      "Documents" # holds vault.enc — the encrypted vault rides along here
      "Pictures"
      "Music"
      "Videos"
      "Desktop"
    ];

    # Fill in each device's Syncthing ID, then rebuild. Get it from the web UI
    # (Actions -> Show ID) or, on a NixOS peer:
    #   sudo -u nico syncthing --home ${home}/.config/syncthing device-id
    # Every folder above is shared with every device listed here.
    devices = {
      # avalon.id  = "XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX";
      # camlann.id = "YYYYYYY-YYYYYYY-YYYYYYY-YYYYYYY-YYYYYYY-YYYYYYY-YYYYYYY-YYYYYYY";
      # windows.id = "ZZZZZZZ-ZZZZZZZ-ZZZZZZZ-ZZZZZZZ-ZZZZZZZ-ZZZZZZZ-ZZZZZZZ-ZZZZZZZ";
      # phone.id   = "WWWWWWW-WWWWWWW-WWWWWWW-WWWWWWW-WWWWWWW-WWWWWWW-WWWWWWW-WWWWWWW";
    };
  in {
    services.syncthing = {
      enable = true;
      inherit user;
      group = "users";
      dataDir = "${home}/.local/share/syncthing";
      configDir = "${home}/.config/syncthing";
      openDefaultPorts = true; # 22000/tcp+udp (sync), 21027/udp (discovery)

      # Fully declarative: config lives here, GUI edits are reverted on rebuild.
      overrideDevices = true;
      overrideFolders = true;

      settings = {
        inherit devices;
        folders = lib.listToAttrs (map (d:
          lib.nameValuePair d {
            id = d;
            label = d;
            path = "${home}/${d}";
            type = "sendreceive";
            devices = builtins.attrNames devices;
          })
        syncedDirs);
      };
    };

    # The synced dirs (Documents, Pictures, …) are already persisted by the
    # impermanence defaults; only Syncthing's own state needs adding.
    persist.user.directories = [
      ".config/syncthing"
      ".local/share/syncthing"
    ];
  };
}
