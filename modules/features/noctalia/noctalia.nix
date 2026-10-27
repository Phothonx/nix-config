{
  flake.nixosModules.noctalia = {config, ...}: {
    # nixpkgs module: package + systemd user service bound to
    # graphical-session.target (niri-session starts it), restarted on crash
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    # Declarative settings as one more *.toml in noctalia's (writable) config
    # dir, so the settings GUI, plugins and custom palettes keep working.
    # User tmpfiles run at login, after the impermanence bind mounts.
    systemd.user.tmpfiles.users.${config.persist.user.name}.rules = [
      "L+ %h/.config/noctalia/nix.toml - - - - ${./config.toml}"
    ];

    persist.user.directories = [
      ".config/noctalia" # plugins, custom palettes
      ".local/state/noctalia" # settings.toml written by the GUI
      ".local/share/noctalia"
      ".cache/noctalia"
    ];
  };
}
