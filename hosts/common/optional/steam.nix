{ pkgs, ... }:
{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
