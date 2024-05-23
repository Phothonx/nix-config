{ pkgs, ... }:
{
  imports =
  [
    ./ide
  ];

  nix.registry = {
    shells = {
      from = {
        id = "shells";
        type = "indirect";
      };
      to = {
        type = "path";
        path = builtins.toString ./flake;
      };
    };
  };
}
