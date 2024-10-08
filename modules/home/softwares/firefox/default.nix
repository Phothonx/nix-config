{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.programs.firefox;
in {
  imports = [
    ./arkenfox.nix
    ./theme.nix
  ];

  config = mkIf cfg.enable {
    programs.firefox = {
      profiles.default = {
        id = 0;
        isDefault = true;
        name = "default";

        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          ublock-origin
          skip-redirect
          sponsorblock
          localcdn
        ];

        search = {
          default = "Google";
          order = ["Google"];
          force = true;
          engines = {
            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g";
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "Home-manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com";
                  params = [
                    {
                      name = "release";
                      value = "master";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@hm"];
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/index.php";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nw"];
            };
          };
        };
      };
    };
  };
}
