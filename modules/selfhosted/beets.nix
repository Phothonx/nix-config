# beets — music importer/tagger (replaces Lidarr). No daemon: run over SSH.
#
# Workflow: search in Prowlarr -> send to qBittorrent (music category) -> then
#   beet import /data/torrents/music/<album>
# beets matches against MusicBrainz (interactive), COPIES into the library
# (originals in /data/torrents stay pristine, so torrents keep seeding), writes
# clean tags to the copy, fetches cover art, embeds it, pulls synced lyrics
# from LRCLIB, and normalizes permissions.
#
# Config is declarative (baked into the wrapper below); mutable state
# (library.db, import log) lives in /data/beets.
{
  flake.nixosModules.beets = {pkgs, ...}: let
    beetsConfig = pkgs.writeText "beets-config.yaml" ''
      directory: /data/media/music
      library: /data/beets/library.db

      import:
        copy: yes
        write: yes
        log: /data/beets/import.log

      plugins: fetchart embedart lyrics permissions

      lyrics:
        synced: yes

      fetchart:
        auto: yes

      embedart:
        auto: yes

      # Keep the library group-accessible (dirs setgid so new files inherit
      # the media group; world-readable either way for Navidrome).
      permissions:
        file: 664
        dir: 2775
    '';

    beet = pkgs.writeShellScriptBin "beet" ''
      # BEETSDIR holds mutable state (state.pickle etc.) on persistent /data,
      # while the config itself comes from the store.
      export BEETSDIR=/data/beets
      exec ${pkgs.beets}/bin/beet --config ${beetsConfig} "$@"
    '';
  in {
    # Imports run as the main user over SSH; write access to the library and
    # the beets state dir comes from the media group.
    users.users.nico.extraGroups = ["media"];

    systemd.tmpfiles.rules = [
      "d /data/beets 0775 nico media -"
      # setgid so everything created inside inherits the media group.
      "d /data/media/music 2775 nico media -"
    ];

    environment.systemPackages = [beet];
  };
}