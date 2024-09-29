{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.hardware.audio;
in {
  options.hardware.audio = with types; {
    enable = mkEnableOption "Enable pipewire";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    hardware.pulseaudio.enable = mkForce false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
