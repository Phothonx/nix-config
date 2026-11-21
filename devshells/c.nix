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

        # C++: gcc already ships g++; clang-tools = clangd, clang-tidy, clang-format
        clang-tools
        bear # generate compile_commands.json from make (`bear -- make`)
        cppcheck
        ninja
        pkg-config
      ];
    };
  };
}
