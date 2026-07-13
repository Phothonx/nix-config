{
  flake.nixosModules.openssh = {
    services.openssh = {
      enable = true;
      ports = [22];
      # Generate host keys into /etc/ssh (persisted via impermanence), so the
      # machine can decrypt its own agenix secrets with its host key.
      generateHostKeys = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";

        X11Forwarding = false;
        GatewayPorts = "no";
        PermitEmptyPasswords = false;

        # Tunnels (ssh -L) are disabled: every service is fronted by caddy at
        # *.camlann.local, so forwarding is unused attack surface. Flip
        # AllowTcpForwarding back to "yes" if a tunnel is ever needed.
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
