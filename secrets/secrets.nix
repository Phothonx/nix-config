let
  nico = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/j7aoPG6YiK6UInYCir/+L3h73O2V36M4M6PdsdREX";
  users = [nico];

  avalon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID+jy/12OrvjxnmeKU3e9Fw8d8m8plcjSkkIFL3omc/r";
  systems = [avalon];
in {
  "git-config.age".publicKeys = users ++ systems;
  "ssh-config.age".publicKeys = users ++ systems;
  "system-password.age".publicKeys = users ++ systems; # hashed version, use mkpasswd
}
