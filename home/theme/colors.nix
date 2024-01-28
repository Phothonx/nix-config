{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.lib.schemeFromYAML "mocha" (builtins.readFile ./base16/mocha.yaml);
}