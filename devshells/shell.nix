{
  perSystem = {pkgs, ...}: {
    devShells.shell = pkgs.mkShell {
      packages = with pkgs; [
        shellcheck
      ];
    };
  };
}
