{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (discord.override { withVencord = true; })
  ];
  xdg.configFile."Vencord/settings/settings.json".source = ./vencord-settings-backup.json;
}