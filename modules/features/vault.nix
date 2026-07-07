# Encrypted vault (gocryptfs), independent of Syncthing.
#
# ~/Documents/vault.enc holds ciphertext only (one encrypted file per real
# file, filenames encrypted too). Because it lives inside Documents, the
# `syncthing` feature replicates it like any other file — no peer, including
# camlann, ever sees plaintext. You mount the decrypted view on demand; the
# mountpoint (~/vault) is at the home root, which is NOT a synced folder, so
# the plaintext view is never itself synced or persisted.
#
#   init-vault     # one-time: create ~/Documents/vault.enc and set the password
#   mount-vault    # decrypt ~/Documents/vault.enc -> ~/vault (prompts)
#   umount-vault   # unmount ~/vault
#
# The same on-disk format is read natively elsewhere (no Cryptomator needed):
#   Windows -> cppcryptfs   Android -> DroidFS   (iOS has no gocryptfs client)
{
  flake.nixosModules.vault = {pkgs, ...}: let
    enc = "$HOME/Documents/vault.enc";
    mnt = "$HOME/vault";

    init-vault = pkgs.writeShellScriptBin "init-vault" ''
      set -eu
      mkdir -p "${enc}"
      exec ${pkgs.gocryptfs}/bin/gocryptfs -init "${enc}"
    '';

    mount-vault = pkgs.writeShellScriptBin "mount-vault" ''
      set -eu
      if [ ! -f "${enc}/gocryptfs.conf" ]; then
        echo "No vault at ${enc} — run 'init-vault' first." >&2
        exit 1
      fi
      mkdir -p "${mnt}"
      exec ${pkgs.gocryptfs}/bin/gocryptfs "${enc}" "${mnt}"
    '';

    umount-vault = pkgs.writeShellScriptBin "umount-vault" ''
      set -eu
      exec /run/wrappers/bin/fusermount3 -u "${mnt}"
    '';
  in {
    environment.systemPackages = [
      pkgs.gocryptfs
      init-vault
      mount-vault
      umount-vault
    ];
  };
}
