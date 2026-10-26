{self, ...}: {
  flake.nixosModules.librewolf = {pkgs, ...}: {
    # prefs + policies are baked into the package (packages/librewolf/)
    environment.systemPackages = [self.packages.${pkgs.stdenv.hostPlatform.system}.librewolf];

    # userChrome.css / userContent.css live in the repo; link them into every
    # profile at login (profile dir names are random, so this can't be static).
    # A profile created during the session gets it on the next login.
    systemd.user.services.librewolf-chrome = {
      description = "Link LibreWolf chrome/ (userChrome.css) into every profile";
      wantedBy = ["default.target"];
      serviceConfig.Type = "oneshot";
      script = ''
        for p in "$HOME"/.config/librewolf/librewolf/*/; do
          [ -f "$p/prefs.js" ] || continue
          if [ -e "$p/chrome" ] && [ ! -L "$p/chrome" ]; then
            echo "skipping $p: chrome/ is a real directory"
            continue
          fi
          ln -sfn ${../../packages/librewolf/chrome} "$p/chrome"
        done
      '';
    };

    xdg.mime.defaultApplications = {
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "text/html" = "librewolf.desktop";
    };

    environment.variables."BROWSER" = "librewolf";

    persist.user.directories = [
      ".config/librewolf" # profiles (LibreWolf follows XDG, not ~/.librewolf)
      ".cache/librewolf"
    ];
  };
}
