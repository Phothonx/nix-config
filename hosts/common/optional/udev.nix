{...}: {
  services.udev = {
    extraRules = ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58c", MODE="0666", TAG+="uaccess"

      KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0817", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="2817", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0102", MODE="0666", TAG+="uaccess"
    '';
  };
}
