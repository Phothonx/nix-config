{self, ...}: {
  flake.nixosModules.noctalia = {
    config,
    pkgs,
    ...
  }: let
    # theme.nix (Base24) -> noctalia palette roles, selected in config.toml
    # by [theme] source = "custom", custom_palette = "nix"
    palette = with self.theme; {
      dark = {
        mPrimary = base0E; # purple
        mOnPrimary = base00;
        mSecondary = base17; # bright purple (lavender)
        mOnSecondary = base00;
        mTertiary = base16; # bright blue (niri focus ring)
        mOnTertiary = base00;
        mError = base08;
        mOnError = base00;
        mSurface = base00;
        mOnSurface = base05;
        mSurfaceVariant = base01;
        mOnSurfaceVariant = base04;
        mOutline = base02;
        mShadow = base11;
        mHover = base02;
        mOnHover = base05;
        terminal = {
          background = base00;
          foreground = base05;
          cursor = base05;
          cursorText = base00;
          selectionBg = base02;
          selectionFg = base05;
          normal = {
            black = base01;
            red = base08;
            green = base0B;
            yellow = base0A;
            blue = base0D;
            magenta = base0E;
            cyan = base0C;
            white = base05;
          };
          bright = {
            black = base02;
            red = base12;
            green = base14;
            yellow = base13;
            blue = base16;
            magenta = base17;
            cyan = base15;
            white = base07;
          };
        };
      };
    };
  in {
    # nixpkgs module: package + systemd user service bound to
    # graphical-session.target (niri-session starts it), restarted on crash
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    # Declarative settings as one more *.toml in noctalia's (writable) config
    # dir, so the settings GUI, plugins and other palettes keep working.
    # User tmpfiles run at login, after the impermanence bind mounts.
    systemd.user.tmpfiles.users.${config.persist.user.name}.rules = [
      "L+ %h/.config/noctalia/nix.toml - - - - ${./config.toml}"
      "d %h/.config/noctalia/palettes 0755 - - -"
      "L+ %h/.config/noctalia/palettes/nix.json - - - - ${pkgs.writeText "noctalia-palette-nix.json" (builtins.toJSON palette)}"
    ];

    persist.user.directories = [
      ".config/noctalia" # plugins, custom palettes
      ".local/state/noctalia" # settings.toml written by the GUI
      ".local/share/noctalia"
      ".cache/noctalia"
    ];
  };
}
