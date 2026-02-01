{
  description = "Basic devshell";

  /*
    To use the local nixpkgs input,
    the nixpkgs flake should be declared in the registry with the following nixos option:
    nix.registry.nixpkgs.flake = inputs.nixpkgs;
  */
  inputs = {
    # nixpkgs.url = "nixpkgs";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = {
    nixpkgs,
    ...
  }: let
    systems = [
      "x86_64-linux"
    ];

    lib = nixpkgs.lib;

    # Set with pkgs for each system
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

    # (pkgs -> attrSetValue) -> attrSetForEachSystem
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
  in {
    devShells = forEachSystem (pkgs:
    let
      latexEnv = pkgs.texlive.withPackages (import ./texlive-packages.nix);
      aspellEnv = pkgs.aspellWithDicts (dicts: with dicts; [ fr en ]);
      pythonEnv = pkgs.python3.withPackages (ps: with ps; [
        # numpy
        # scipy
        # matplotlib
        # jupyter
      ]);
    in
    {
      default = pkgs.mkShell {
        venvDir = ".venv";
        # https://thor.enseirb-matmeca.fr/ruby/docs/teaching/vmlinux
        packages = with pkgs; [

          # ======== PYTHON ========
          # pythonEnv

          # ======== OCAML ========
          # ocaml
          # ocamlPackages.utop

          # ======== C/ASM ========
          # gcc
          # valgrind
          # cmake
          # gdb
          # yasm

          # ======== LATEX ========
          # latexEnv
          # latexrun
          # aspellEnv

          #  ======== JS ========
          # nodejs
          # nodePackages.pnpm

          #  ======== OTHER ========
          # shellcheck

        ];
      };
    });
  };
}
