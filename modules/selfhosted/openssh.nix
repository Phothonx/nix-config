{
  flake.nixosModules.openssh = {
    services.openssh = {
      enable = true;
      ports = [22];
      generateHostKeys = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";

        X11Forwarding = false;
        GatewayPorts = "no";
        PermitEmptyPasswords = false;

        AllowTcpForwarding = "no";
        AllowAgentForwarding = "no";
        TCPKeepAlive = "no";
        MaxSessions = 2;

        ClientAliveInterval = 120;
        ClientAliveCountMax = 2;
        LoginGraceTime = 30;
        MaxAuthTries = 3;
      };
    };

    services.fail2ban.enable = true;
  };
}
