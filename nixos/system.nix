{ pkgs, ...}: 
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  security.pam.services.swaylock = {};
  services.gvfs.enable = true; # changer
  programs.dconf.enable = true;

  nixpkgs = {
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    vim
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "fr";
  };

  system.stateVersion = "23.11";
}