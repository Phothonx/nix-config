{
  flake.nixosModules.wireguard = { pkgs, ... }: {

    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };

    networking = {
      firewall = {
        allowedUDPPorts = [ 51820 ];
        trustedInterfaces = [ "wg0" ];
      };

      nat = {
        enable = true;
        externalInterface = "wlp5s0";
        internalInterfaces = [ "wg0" ];
      };

      wg-quick.interfaces.wg0 = {
        address = [ "10.0.0.1/24" "fd00::1/64" ];  # IPv4 + IPv6
        listenPort = 51820;
        privateKeyFile = "/secrets/wireguard/server.key";

        postUp = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A FORWARD -o wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o wlp5s0 -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -A FORWARD -o wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -o wlp5s0 -j MASQUERADE
        '';
        preDown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -D FORWARD -o wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o wlp5s0 -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -D FORWARD -o wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -o wlp5s0 -j MASQUERADE
        '';

        peers = [
          {
            # phone
            publicKey = "PHONE_PUBLIC_KEY";
            allowedIPs = [ "10.0.0.2/32" "fd00::2/128" ];
          }
          {
            # laptop
            publicKey = "LAPTOP_PUBLIC_KEY";
            allowedIPs = [ "10.0.0.3/32" "fd00::3/128" ];
          }
        ];
      };
    };
  };
}
