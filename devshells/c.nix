{
  perSystem = {pkgs, ...}: {
    devShells.c = pkgs.mkShell {
      hardeningDisable = ["fortify" "fortify3"];
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
