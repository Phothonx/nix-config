{ config, pkgs, ... }: 
let
  colors = config.colorScheme.colors;
in
{
    programs.wofi = {
        enable = true;
        settings = {};
        style = ''
        '';
    };
}