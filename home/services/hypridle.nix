{ pkgs, inputs, lib, config, ... }:
let # Made by fufexan or linuxmobile idk XD
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      sleep 1
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in
{
  services.hypridle = {
    enable = true;
    settings = {
      beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
      lockCmd = lib.getExe config.programs.hyprlock.package;

      listeners = [
        {
          timeout = 1200;
          onTimeout = suspendScript.outPath;
        }
      ];
    };
  };
}
