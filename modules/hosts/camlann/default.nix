{
  self,
  inputs,
  withSystem,
  ...
}: {
  flake.nixosConfigurations.camlann = withSystem "x86_64-linux" ({pkgs, ...}:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {nixpkgs.pkgs = pkgs;}
        self.nixosModules.camlannConfiguration
      ];
    });
}
