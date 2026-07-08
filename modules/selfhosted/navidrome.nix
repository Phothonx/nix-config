# Navidrome — specialised music streaming server (Subsonic-compatible).
# Complements Jellyfin (kept for video); reads the same library Lidarr fills at
# /data/media/music. Runs as navidrome:media so it can read that group-owned
# tree; the module binds the music folder read-only into its sandbox.
{
  flake.nixosModules.navidrome = {
    services.navidrome = {
      enable = true; # 4533
      user = "navidrome";
      group = "media"; # read access to /data/media/music (lidarr:media)

      settings = {
        MusicFolder = "/data/media/music";
        Address = "127.0.0.1"; # local only; caddy fronts it
        Port = 4533;
        # Artist images / bios need an external agent — add API keys later:
        #   LastFM.ApiKey / LastFM.Secret, Spotify.ID / Spotify.Secret
      };
    };

    persist.directories = [
      "/var/lib/navidrome" # library DB, play counts, users
    ];
  };
}