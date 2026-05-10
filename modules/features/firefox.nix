{self, ...}: {
  flake.nixosModules.firefox = {
    pkgs,
    lib,
    ...
  }: {
    # imports = [
    #   self.nixosModules.impermanence
    # ];

    programs.firefox = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.firefox;

      # broken in wrapper for now
      policies = lib.importJSON ../../packages/firefox/policies.json;
    };

    xdg.mime.defaultApplications = {
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "text/html" = "firefox.desktop";
    };

    environment.variables."BROWSER" = "firefox";

    persist.user.directories = [
      ".config/mozilla"
      ".config/mozilla/firefox"
      ".cache/mozilla"
    ];
  };
}
