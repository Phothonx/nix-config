{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.system.boot;
in {
  options.system.boot = {
    enable = mkEnableOption "Enable boot";
  };

  config = mkIf cfg.enable {
    boot = {
      tmp.cleanOnBoot = true;
      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
          # https://github.com/NixOS/nixpkgs/blob/c32c39d6f3b1fe6514598fa40ad2cf9ce22c3fb7/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix#L66
          editor = false;
        };
        efi.canTouchEfiVariables = true;
        timeout = 3;
      };
    };
  };
}
