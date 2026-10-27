{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # evemu
      vlc
      loupe
      imv
      # audacity
      # bitwarden-desktop
      # spotify
      spotifast
      localsend
      # teamspeak6-client
      # ungoogled-chromium
      vesktop
      webcord-vencord
      wl-clipboard
      via
      # libreoffice
      # freecad
      # mission-planner
      kdePackages.kdenlive
      # phoronix-test-suite
      # blender

      rustdesk
    ];

    persist.user.directories = [
      ".config/chromium"
      ".config/Bitwarden"
      ".config/spotify"
      ".config/spotifast"
      ".local/share/spotifast"
      ".cache/spotifast"
      # session.json + credential-storage/ (sign-in state)
      ".local/state/spotifast"
      ".config/vlc"
      ".local/share/vlc"
      ".config/vesktop"
      ".config/WebCord"
      ".config/localsend"
      ".config/rustdesk"
      ".config/Moonlight Game Streaming Project"
    ];

    # tailscaled's own state (keys, node identity) — system-level, not
    # per-user. Without this, `sudo tailscale up` has to be redone every boot.
    persist.directories = [
      "/var/lib/tailscale"
    ];

    services.tailscale = {
      enable = true;
      openFirewall = true; # direct peer connections instead of relaying via DERP
    };

    hardware.uinput.enable = true;

    programs.moonlight-qt.enable = true;
    programs.moonlight-qt.capSysNice = true;
  };
}
