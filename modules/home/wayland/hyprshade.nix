{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.hyprshade;
in
{
  options.programs.hyprshade = {
    enable = mkEnableOption "enable screen shader util";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ hyprshade ];

    xdg.configFile."hyprshade/config.toml".text = ''
      [[shades]]
      name = "vibrance"
      default = true  # shader to use during times when there is no other shader scheduled
      
      [[shades]]
      name = "blue-light-filter"
      start_time = 19:00:00
      end_time = 07:00:00   # optional if you have more than one shade with start_time
    '';
  };
}
