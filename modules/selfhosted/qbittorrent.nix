{
  flake.nixosModules.qbittorrent = {config, pkgs, ...}: {

    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0750 qbittorrent qbittorrent -"
    ];

    services.qbittorrent = {
      enable = true; # 8080
      profileDir = "/data/qBittorrent/";
    };

    age.secrets.protonvpn-wg.file = ../../secrets/protonvpn-wg.age;
    networking.wg-quick.interfaces.qbproton = {
      configFile = config.age.secrets.protonvpn-wg.path;
    };

    environment.systemPackages = with pkgs; [
      libnatpmp
      tcpdump
      iptables
      gnugrep
      gawk
    ];

    systemd.services.proton-portforward = {
      description = "ProtonVPN NAT-PMP Port Forwarding";

      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];

      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = 5;
      };

      script = ''
      set -euo pipefail

      GATEWAY="10.2.0.1"
      IFACE="qbproton"

      current_port=""

      cleanup() {
        if [[ -n "$current_port" ]]; then
          ${pkgs.iptables}/bin/iptables -D INPUT -i "$IFACE" -p tcp --dport "$current_port" -j ACCEPT || true
          ${pkgs.iptables}/bin/iptables -D INPUT -i "$IFACE" -p udp --dport "$current_port" -j ACCEPT || true
        fi
      }

      trap cleanup EXIT

      while true; do
        echo "[*] Requesting Proton forwarded port: $current_port..."

        output="$(
          ${pkgs.libnatpmp}/bin/natpmpc \
            -a 1 0 tcp 60 -g "$GATEWAY" 2>/dev/null || true
        )"

        new_port="$(
          echo "$output" \
            | ${pkgs.gnugrep}/bin/grep "Mapped public port" \
            | ${pkgs.gawk}/bin/awk '{print $4}'
        )"

        if [[ -z "$new_port" ]]; then
          echo "[!] Failed to obtain forwarded port"
          sleep 10
          continue
        fi

        if [[ "$new_port" != "$current_port" ]]; then
          echo "[+] New forwarded port: $new_port"

          if [[ -n "$current_port" ]]; then
            ${pkgs.iptables}/bin/iptables -D INPUT -i "$IFACE" -p tcp --dport "$current_port" -j ACCEPT || true
            ${pkgs.iptables}/bin/iptables -D INPUT -i "$IFACE" -p udp --dport "$current_port" -j ACCEPT || true
          fi

          ${pkgs.iptables}/bin/iptables -A INPUT -i "$IFACE" -p tcp --dport "$new_port" -j ACCEPT
          ${pkgs.iptables}/bin/iptables -A INPUT -i "$IFACE" -p udp --dport "$new_port" -j ACCEPT

          current_port="$new_port"
        fi

        ${pkgs.libnatpmp}/bin/natpmpc \
          -a "$current_port" "$current_port" tcp 60 -g "$GATEWAY" >/dev/null

        ${pkgs.libnatpmp}/bin/natpmpc \
          -a "$current_port" "$current_port" udp 60 -g "$GATEWAY" >/dev/null

        sleep 45
      done
      '';
    };
  };
}
