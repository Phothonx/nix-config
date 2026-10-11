{
  flake.nixosModules.maintenance = {
    services.btrfs.autoScrub.enable = true;
    services.smartd.enable = true;
    services.fwupd.enable = true;
  };
}
