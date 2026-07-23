{
  flake.nixosModules.qbittorrent = {
    config,
    pkgs,
    ...
  }: {
    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0755 qbittorrent media -"
      "d /data/qBittorrent/downloads 0775 qbittorrent media -"
      "d /data/torrents/books 0775 qbittorrent media -"
      "d /data/torrents/movies 0775 qbittorrent media -"
      "d /data/torrents/music 0775 qbittorrent media -"
      "d /data/torrents/tv 0775 qbittorrent media -"
    ];

    services.qbittorrent = {
      enable = true; # 8080
      group = "media";
      profileDir = "/data/qBittorrent/";
    };

    age.secrets.protonvpn-wg.file = ../../secrets/net/protonvpn-wg.age;
    networking.wg-quick.interfaces.qbproton.configFile = config.age.secrets.protonvpn-wg.path;

    environment.systemPackages = with pkgs; [
      libnatpmp
      tcpdump
      nftables
      gnugrep
      gawk
    ];

    systemd.services.proton-portforward = {
      description = "ProtonVPN NAT-PMP Port Forwarding";

      wantedBy = ["multi-user.target"];
      after = ["network-online.target" "wg-quick-qbproton.service"];
      requires = ["wg-quick-qbproton.service"];

      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = 5;
      };

      # Manages its own nftables table (rather than poking the host firewall's
      # chain, e.g. the legacy iptables "nixos-fw" chain that doesn't exist
      # once networking.nftables.enable = true switches the backend). Priority
      # -10 runs before the default filter hook (0), so this table's accept
      # wins regardless of the main firewall ruleset's own rules/backend.
      script = ''
        set -euo pipefail
        GATEWAY="10.2.0.1"
        IFACE="qbproton"
        FAMILY="inet"
        TABLE="qbproton_portforward"
        current_port=""

        NFT="${pkgs.nftables}/bin/nft"

        "$NFT" "add table $FAMILY $TABLE"
        "$NFT" "add chain $FAMILY $TABLE input { type filter hook input priority -10 ; }"

        cleanup() {
          "$NFT" "delete table $FAMILY $TABLE" || true
        }
        trap cleanup EXIT

        while true; do
          echo "[*] Requesting Proton forwarded port ("$current_port")..."
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
            echo "[!] Failed to obtain forwarded port, retrying..."
            sleep 10
            continue
          fi

          if [[ "$new_port" != "$current_port" ]]; then
            echo "[+] New forwarded port: $new_port"
            "$NFT" "flush chain $FAMILY $TABLE input"
            "$NFT" "add rule $FAMILY $TABLE input iifname $IFACE tcp dport $new_port accept"
            "$NFT" "add rule $FAMILY $TABLE input iifname $IFACE udp dport $new_port accept"
            current_port="$new_port"
          fi

          # Renew lease (expires after 60s, renew every 45s)
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
