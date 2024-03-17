{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (discord.override { withVencord = true; })
  ];
  #xdg.configFile."Vencord/settings/settings.json".source = ./settings.json;
  xdg.configFile."Vencord/themes/midnight-catppuccin-mocha.theme.css".source = ./midnight-catppuccin-mocha.theme.css;
}