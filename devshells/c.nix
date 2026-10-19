{
  perSystem = {pkgs, ...}: {
    devShells.c = pkgs.mkShell {
      packages = with pkgs; [
        gcc
        valgrind
        cmake
        gdb
        yasm
        libclang
        flex
        bison
      ];
    };
  };
}
