{
  perSystem = {pkgs, ...}: {
    devShells.java = pkgs.mkShell {
      packages = with pkgs; [
        jdk
      ];
    };
  };
}
