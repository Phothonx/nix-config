{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.vesktop
  ];
  xdg.configFile."Vencord/settings/settings.json".source = ./settings.json;
  xdg.configFile."Vencord/themes/midnight.theme.css".source = ./midnight.theme.css;
}
