{ pkgs, systemConfig, ... }:
{
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
      trusted-users = ["root" "@wheel"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };

  # faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };
  
  services.dbus.implementation = "broker";

  nixpkgs = {
    config.allowUnfree = true;
  };

  time.timeZone = systemConfig.timeZone;
  i18n.defaultLocale = systemConfig.locale;
  console = {
    keyMap = systemConfig.layout;
  };

  system.stateVersion = "23.11";
}
