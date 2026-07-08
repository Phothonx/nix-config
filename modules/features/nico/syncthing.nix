# Personal home-data sync + backup.
#
# Syncthing (peer-to-peer, TLS 1.3 transport) replicates your personal home
# directories between devices, with camlann as an always-on backup peer. It has
# no server role — every peer runs the same daemon.
#
# This is independent of the `vault` feature: the gocryptfs vault simply lives
# inside Documents, so it rides along on this sync like any other file.
#
# Devices and folders are managed in the WEB UI, not here — on purpose. This
# repo is public, and a Syncthing device ID lets anyone look up the device's
# current IP via global discovery, so we keep IDs out of the tree. The IDs and
# folder-sharing live only in the persisted, private runtime config
# (~/.config/syncthing). `overrideDevices`/`overrideFolders` are therefore set
# to false: their default (true) would make a rebuild DELETE anything you
# paired in the GUI.
#
# One-time setup in the GUI (avalon: http://127.0.0.1:8384 ; camlann is
# headless — reach it with `ssh -L 8384:localhost:8384 camlann`):
#   1. On each device, Actions -> Show ID, and Add Remote Device on the others.
#   2. Add these folders (Add Folder), then share each with your devices:
#        Documents (~/Documents)  <- holds vault.enc, the encrypted vault
#        Pictures  (~/Pictures)
#        Music     (~/Music)
#        Videos    (~/Videos)
#        Desktop   (~/Desktop)
{
  flake.nixosModules.syncthing = {...}: let
    user = "nico";
    home = "/home/${user}";
  in {
    services.syncthing = {
      enable = true;
      inherit user;
      group = "users";
      dataDir = "${home}/.local/share/syncthing";
      configDir = "${home}/.config/syncthing";
      openDefaultPorts = true; # 22000/tcp+udp (sync), 21027/udp (discovery)

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