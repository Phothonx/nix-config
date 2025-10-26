{pkgs, ...}: {
  home.packages = with pkgs; [
    mindustry-wayland
    osu-lazer-bin
    atlauncher
    prismlauncher
    (pkgs.buildFHSEnv (pkgs.appimageTools.defaultFhsEnvArgs
      // {
        name = "fhs-albion";
        targetPkgs = pkgs:
          with pkgs; [
            krb5
            libxau
            libxdmcp
          ];
        profile = ''export FHS=1'';
        runScript = "fish";
      }))
  ];
}
