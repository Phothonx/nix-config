{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.qutebrowser;
in {
  config = mkIf cfg.enable {
    programs.quetebrowser = {

      settings = {};

      quickmarks = {
        nixpkgs = "https://github.com/NixOS/nixpkgs";
        home-manager = "https://github.com/nix-community/home-manager";
      };

      searchEngines = {
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://wiki.nixos.org/index.php?search={}";
        g = "https://www.google.com/search?hl=en&q={}";
      };

    };
  };
}
