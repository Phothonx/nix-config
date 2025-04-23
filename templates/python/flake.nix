{
  description = "Basic python devshell";

  inputs = {
    # should be declared in USER registry with the nixos option:
    # nix.registry.nixpkgs.flake = inputs.nixpkgs;
    nixpkgs.url = "nixpkgs";
    # this is not mandatory but it will ensure this version of nixpkgs is always present on your computer
    # by using the same as your system
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    lib = nixpkgs.lib;

    systems = ["x86_64-linux"];

    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
  in {
    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        # if package not in nixpkgs: https://github.com/nix-community/pip2nix
        # ex: nix run github:nix-community/pip2nix -- generate
        # or directly builPythonPackage
        venvDir = ".venv";
        packages = [
          (pkgs.python3.withPackages (p:
            with p; [
              # ex:
              # matplotlib
              # scipy
              # requests
              # jupyter
            ]))
        ];
      };
    });
  };
}
