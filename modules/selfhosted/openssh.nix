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

        ClientAliveInterval = 120;
        ClientAliveCountMax = 5;
        LoginGraceTime = 30;
        MaxAuthTries = 3;
      };
    };

    services.fail2ban.enable = true;
  };
}
