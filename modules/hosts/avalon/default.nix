{
  self,
  inputs,
  withSystem,
  ...
}: {
  flake.nixosConfigurations.avalon = withSystem "x86_64-linux" ({pkgs, ...}:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {nixpkgs.pkgs = pkgs;}
        self.nixosModules.avalonConfiguration
      ];
    });
}
