{ ... }:
{
  imports = [
    ./aliases.nix
    ./config.nix
    ./env.nix
  ];

  programs.bash.enable = false;
  programs.nushell.enable = true;
}
