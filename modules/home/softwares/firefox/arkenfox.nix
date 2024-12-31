{
  config,
  lib,
  inputs,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (inputs) arkenfox-nixos;
  cfg = config.programs.firefox.arkenfox;
in {

  # creates options programs.firefox.arkenfox.enable

  imports = [arkenfox-nixos.hmModules.arkenfox];

  config = mkIf cfg.enable {
    programs.firefox = {
      arkenfox = {
        version = "master";
      };

      profiles.default.arkenfox = {
        # https://arkenfox.dwarfmaster.net/
        enable = true;
        "0000".enable = true;
        "0100" = {
          enable = true;
          "0102"."browser.startup.page".value = 3;
          "0104"."browser.newtabpage.enabled".value = false;
        };
        "0200".enable = true;
        "0300".enable = true;
        "0400" = {
          enable = false;
        };
        "0600".enable = true;
        "0700".enable = true;
        "0800" = {
          enable = true;
        };
        "0900".enable = true;
        "1000" = {
          enable = true;
          "1003"."browser.sessionstore.privacy_level".value = 1;
        };
        "1200".enable = true;
        "1600".enable = true;
        "1700".enable = true;
        "2000".enable = true;
        "2400".enable = true;
        "2600".enable = true;
        "2700".enable = true;
        "2800" = {
          enable = true;
          "2811" = {
            "privacy.clearOnShutdown.history".value = false;
            "privacy.clearOnShutdown.downloads".value = false;
          };
          "2815"."privacy.clearOnShutdown.cookies".value = false; # mankiller lazyness
        };
        "4000".enable = true;
        "4500".enable = false;
        "6000".enable = true;
      };
    };
  };
}
