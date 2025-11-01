{
  outputs,
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      inputs.nur.overlays.default
      inputs.my-shell.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
    };
  };
  boot.binfmt.emulatedSystems = lib.mkIf (pkgs.stdenv.hostPlatform.system == "x86_64-linux") ["aarch64-linux"];
}
