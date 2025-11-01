{
  config,
  lib,
  ...
}: let
  getSSHkey = name: {
    sops.secrets."ssh/id_ed25519_${name}/private" = {
      sopsFile = ../../../secrets/keys.yaml;
      format = "yaml";
      path = "${config.home.homeDirectory}/.ssh/id_ed25519_${name}";
    };
    sops.secrets."ssh/id_ed25519_${name}/public" = {
      sopsFile = ../../../secrets/keys.yaml;
      format = "yaml";
      path = "${config.home.homeDirectory}/.ssh/id_ed25519_${name}.pub";
    };
  };
  importSSHKeys = list: builtins.foldl' (a: b: lib.recursiveUpdate a b) {} (map getSSHkey list);
in
  lib.recursiveUpdate
  (importSSHKeys [
    "github"
    "codeberg"
    "thor"
    "enseirb"
    "crystal"
  ])
  {
    programs.ssh = {
      enableDefaultConfig = false;
      enable = true;

      matchBlocks = {
        "*" = {
          forwardAgent = true;
          addKeysToAgent = "yes";
          identitiesOnly = true;
        };

        "enseirb".hostname = "ssh.enseirb-matmeca.fr";
        "enseirb".identityFile = config.sops.secrets."ssh/id_ed25519_enseirb/private".path;

        "txistu trombone".proxyJump = "enseirb";

        "github.com".hostname = "github.com";
        "github.com".identityFile = config.sops.secrets."ssh/id_ed25519_github/private".path;

        "thor.enseirb-matmeca.fr".hostname = "thor.enseirb-matmeca.fr";
        "thor.enseirb-matmeca.fr".identityFile = config.sops.secrets."ssh/id_ed25519_thor/private".path;

        "codeberg.org".hostname = "codeberg.org";
        "codeberg.org".identityFile = config.sops.secrets."ssh/id_ed25519_codeberg/private".path;
      };
    };
  }
