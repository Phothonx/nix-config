{
  flake.nixosModules.navidrome = {config, ...}: {
    services.navidrome = {
      enable = true; # 4533
      user = "navidrome";
      group = "media"; # read access to /data/media/music (nico:media)

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
