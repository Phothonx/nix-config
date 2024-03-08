{ pkgs, inputs, lib, config, ... }:
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
  imports = [ inputs.hypridle.homeManagerModules.hypridle ];

  services.hypridle = {
    enable = true;
    beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
    lockCmd = lib.getExe config.programs.hyprlock.package;

    listeners = [
      {
        timeout = 1200;
        onTimeout = suspendScript.outPath;
      }
    ];
  };
}