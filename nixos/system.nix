{ pkgs, systemConfig, inputs, lib, ... }:
{
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
      trusted-users = ["root" "@wheel"];
    };
    gc.automatic = false;
    extraOptions = ''
        keep-outputs = true
        keep-derivations = true
    '';
    # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
    registry.nixpkgs.flake = inputs.nixpkgs;
    channel.enable = false;
  };

  # but NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake.
  # Make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
  environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  # https://github.com/NixOS/nix/issues/9574
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";

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
