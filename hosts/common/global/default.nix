{ pkgs, outputs, inputs, ... }:
{
  imports = [
    ./nix.nix
    ./locale.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      inputs.nur.overlays.default
      ];
    config = {
      allowUnfree = true;
    };
  };
}
