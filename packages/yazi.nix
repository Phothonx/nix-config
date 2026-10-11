{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.yazi = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.yazi;
    };
  };
}
