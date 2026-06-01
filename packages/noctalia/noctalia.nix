{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.noctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
      inherit pkgs;

      runtimePkgs = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu
        noto-fonts-color-emoji

        papirus-icon-theme
      ];

      settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
    };
  };
}
