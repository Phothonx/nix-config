{ config, lib, userConfig, ... }:
{
  services.greetd = let
    session = {
      command = lib.getExe config.programs.hyprland.package;
      user = userConfig.userName;
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };
}
