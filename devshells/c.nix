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
        flex
        bison

        # C++: gcc already ships g++; clang-tools = clangd, clang-tidy, clang-format
        clang-tools
        bear
        cppcheck
        ninja
        pkg-config
      ];
    };
  };
}
