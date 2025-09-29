{ pkgs, ...}:
{
  services.udev = {
    extraRules= ''
      ACTION!="remove", SUBSYSTEMS=="usb", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58c", MODE="0660", TAG+="uaccess"

      ACTION!="remove", SUBSYSTEMS=="usb", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0817", MODE="0660", TAG+="uaccess"
      ACTION!="remove", SUBSYSTEMS=="usb", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="2817", MODE="0660", TAG+="uaccess"
      ACTION!="remove", SUBSYSTEMS=="usb", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0102", MODE="0660", TAG+="uaccess"
    '';
  };
}
