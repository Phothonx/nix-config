{self, ...}: {
  flake.nixosModules.librewolf = {pkgs, ...}: {
    # prefs + policies are baked into the package (packages/librewolf/)
    environment.systemPackages = [self.packages.${pkgs.stdenv.hostPlatform.system}.librewolf];

    xdg.mime.defaultApplications = {
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "text/html" = "librewolf.desktop";
    };

    environment.variables."BROWSER" = "librewolf";

    persist.user.directories = [
      ".librewolf" # profiles (+ librewolf.overrides.cfg if ever used outside Nix)
      ".cache/librewolf"
    ];
  };
}
