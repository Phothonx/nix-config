{
  description = ''
       ________      __          __       __               __         ____    
      / ____/ /___  / /_  ____ _/ /  ____/ /__ _   _______/ /_  ___  / / /____
     / / __/ / __ \/ __ \/ __ `/ /  / __  / _ \ | / / ___/ __ \/ _ \/ / / ___/
    / /_/ / / /_/ / /_/ / /_/ / /  / /_/ /  __/ |/ (__  ) / / /  __/ / (__  ) 
    \____/_/\____/_.___/\__,_/_/   \__,_/\___/|___/____/_/ /_/\___/_/_/____/  
  '';

  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system} = {
      "python" = pkgs.mkShell {
        buildInputs = with pkgs; [
          python311
          python311Packages.numpy
          python311Packages.matplotlib
        ];
        shellHook = ''
          echo "Python devShell"
        '';
      };
      
      "ocaml" = pkgs.mkShell {
        buildInputs = with pkgs; [
          ocaml
          ocamlPackages.utop
        ];
        shellHook = ''
          echo "Ocaml devShell"
        '';
      };

      "c" = pkgs.mkShell {
        buildInputs = with pkgs; [
          gcc
        ];
        shellHook = ''
          echo "C devShell"
        '';
      };
    };
  };
}
