{
  flake.nixosModules.printing = {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # cups-filters ships by default; cups-browsed is a daemon, not a driver
    services.printing.enable = true;

    services.ipp-usb.enable = true;
  };
}
