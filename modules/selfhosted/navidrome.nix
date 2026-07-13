# Navidrome — specialised music streaming server (Subsonic-compatible).
# Complements Jellyfin (kept for video); reads the same library Lidarr fills at
# /data/media/music. Runs as navidrome:media so it can read that group-owned
# tree; the module binds the music folder read-only into its sandbox.
#
# The `navidrome-env` secret feeds the metadata agents as ND_* env vars — kept
# out of this public repo:
#   ND_SPOTIFY_ID=...       # artist images   (developer.spotify.com/dashboard)
#   ND_SPOTIFY_SECRET=...
#   ND_LASTFM_APIKEY=...    # optional: bios + in-app similar/radio
#   ND_LASTFM_SECRET=...    #   (last.fm/api/account/create)
# Listening history stays private via ListenBrainz (per-user token in the web
# UI) — that's separate from these read-only lookups. Album/cover art is local
# (Lidarr). Synced lyrics: served if embedded or present as .lrc sidecars.
{
  flake.nixosModules.navidrome = {config, ...}: {
    age.secrets.navidrome-env.file = ../../secrets/selfhosted/navidrome-env.age;

    services.navidrome = {
      enable = true; # 4533
      user = "navidrome";
      group = "media"; # read access to /data/media/music (lidarr:media)
      environmentFile = config.age.secrets.navidrome-env.path;

      settings = {
        MusicFolder = "/data/media/music";
        Address = "127.0.0.1"; # local only; caddy fronts it
        Port = 4533;
        EnableSharing = true; # public share links
      };
    };

    persist.directories = [
      "/var/lib/navidrome" # library DB, play counts, users
    ];
  };
}
