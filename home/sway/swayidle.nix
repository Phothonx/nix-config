{ pkgs, ... }:
let # Made by fufexan or linuxmobile idk XD
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize --screenshots --effect-blur=8x7";
      }
    ];
    timeouts = [
      {
        timeout = 1200;
        command = suspendScript.outPath;
      }
    ];
  };
}