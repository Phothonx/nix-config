let
  nico = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPBjFuk+j1jgUmqtVEVDbK7XqmMSgVTw+IF+kgYLOYH2";
  users = [ nico ];

  avalon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZRH8QgdMKfr2L9DC+g4yEXlyZvq3+yQ6UStadKxIgR";
  systems = [ avalon ];
in
{
  "secret1.age".publicKeys = users ++ systems;
}
