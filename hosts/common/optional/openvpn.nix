{...}: {
  services.openvpn.servers = {
    tryhackmeVPN = {
      # systemctl status openvpn-tryhackmeVPN.service
      config = ''config /home/nico/Dev/try-hack-me/ncio.gravitate56.ovpn '';
      autoStart = false;
    };
  };
}
