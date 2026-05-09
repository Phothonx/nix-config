{
  flake.nixosModules.openssh = { ... }: {

    services.openssh = {
      enable = true;
      ports = [ 22 ];
      generateHostKeys = false;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";

        # Security
        X11Forwarding = false;
        AllowTcpForwarding = false;
        GatewayPorts = "no";
        PermitEmptyPasswords = false;

        ClientAliveInterval = 120;
        ClientAliveCountMax = 5;
      };
    };

    # networking.firewall.allowedTCPPorts = [ 22 ];
    #
    # services.fail2ban.enable = true;
    # services.endlessh = {
    #   enable = true;
    #   port = 22;
    #   openFirewall = true;
    # };
  };
}
