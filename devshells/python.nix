{
  perSystem = {pkgs, ...}: {
    devShells.python = pkgs.mkShell {
      venvDir = ".venv";
      packages = with pkgs; [
        (python3.withPackages (ps:
          with ps; [
            numpy
            scipy
            matplotlib
            # jupyter
            pandas
            requests
          ]))
      ];
    };
  };
}
