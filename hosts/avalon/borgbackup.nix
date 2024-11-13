{
  config,
  pkgs,
  ...
}: let
  home = "/home/${config.user.name}";
in {
  services.borgbackup.jobs."avalon" = {
    inhibitsSleep = true;

    paths = [
      "${home}/Desktop"
      "${home}/Dev"
      "${home}/Downloads"
      "${home}/Medias"
    ];

    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /home/nico/pass.txt";
    };

    environment.BORG_RSH = "ssh -i /home/nico/.ssh/id_ed25519";

    repo = "mtsh79dp@mtsh79dp.repo.borgbase.com:repo";

    compression = "auto,zstd";

    startAt = "daily";

    postCreate = ''
      ${pkgs.dunst}/bin/dunstify\
        "Borg backup created : $archivename" \
        --urgency=normal \
        --timeout=3000 \
    '';
  };
}
