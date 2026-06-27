let
  recovery = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFGrGyKylXQVEwBcJj5Ue4ru4e+fe+eDeJBAJrZeNozA"];

  nico = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/j7aoPG6YiK6UInYCir/+L3h73O2V36M4M6PdsdREX";
  users = [nico];

  avalon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID+jy/12OrvjxnmeKU3e9Fw8d8m8plcjSkkIFL3omc/r";
  camlann = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKq4pjy32/r1X80XEx5GHpdqcAeCNXpvyoLz90OI+bsM";
  systems = [avalon camlann];
in {
  "github_config.age".publicKeys = recovery ++ users ++ systems;
  "thor_config.age".publicKeys = recovery ++ users ++ systems;
  "ssh_config.age".publicKeys = recovery ++ users ++ systems;

  "id_ed25519_enseirb.age".publicKeys = recovery ++ users ++ systems;
  "id_ed25519_thor.age".publicKeys = recovery ++ users ++ systems;
  "id_ed25519_github.age".publicKeys = recovery ++ users ++ systems;

  "psswd_nico.age".publicKeys = recovery ++ users ++ systems;
  "selfhosted_credentials.age".publicKeys = recovery ++ users ++ systems;
  "radarr-api.age".publicKeys = recovery ++ users ++ systems;
  "sonarr-api.age".publicKeys = recovery ++ users ++ systems;

  "protonvpn-wg.age".publicKeys = recovery ++ users ++ systems;
  "jnms-wg.age".publicKeys = recovery ++ users ++ systems;
}
