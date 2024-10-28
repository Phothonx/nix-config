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

    encryption.mode = "none";

    environment.BORG_RSH = "ssh -i /home/nico/.ssh/id_ed25519";

    repo = "ssh://d23p9qf6@d23p9qf6.repo.borgbase.com/./repo";

    startAt = "daily";

    postCreate = ''
      ${pkgs.dunst}/bin/dunstify\
        "Borg backup created : $archivename" \
        --urgency=normal \
        --timeout=3000 \
    '';
  };
}
