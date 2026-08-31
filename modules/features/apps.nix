{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      evemu
      vlc
      loupe
      imv
      audacity
      # bitwarden-desktop
      spotify
      localsend
      teamspeak6-client
      ungoogled-chromium
      vesktop
      wl-clipboard
      via
      libreoffice
      # freecad
      # mission-planner
      # kdePackages.kdenlive
      # phoronix-test-suite
      # blender

      tailscale
      rustdesk
    ];

    persist.user.directories = [
      ".config/chromium"
      ".config/Bitwarden"
      ".config/spotify"
      ".config/vesktop"
      ".config/localsend"
    ];

    # Just the package isn't enough for either — both need active
    # services/permissions to actually work, not just the binary on PATH.

    # tailscaled as a proper systemd service (the package alone gives you the
    # CLI but no daemon to talk to). One-time interactive step still needed
    # after rebuild: `sudo tailscale up` to authenticate this machine.
    services.tailscale = {
      enable = true;
      openFirewall = true; # direct peer connections instead of relaying via DERP
    };

    # RustDesk's remote CONTROL (not just screen viewing) injects keyboard/
    # mouse via the kernel's uinput device, which needs an explicit grant —
    # without this, screen sharing works but remote input silently doesn't.
    hardware.uinput.enable = true;
    users.users.nico.extraGroups = ["uinput" "input"];
  };
}
