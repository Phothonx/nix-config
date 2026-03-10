{
  config,
  lib,
  ...
}: {
  sops.secrets."git_config/thor" = {
    sopsFile = ../../../secrets/nico.yaml;
    format = "yaml";
    path = "${config.xdg.configHome}/git/thor_config";
  };
  sops.secrets."git_config/github" = {
    sopsFile = ../../../secrets/nico.yaml;
    format = "yaml";
    path = "${config.xdg.configHome}/git/github_config";
  };

  programs.git = {
    enable = true;
    signing.format = null;
    ignores = lib.splitString "\n" (builtins.readFile ./ignores);
    includes = [
      {
        path = config.sops.secrets."git_config/github".path;
        condition = "hasconfig:remote.*.url:git@github.com:*/**";
      }
      {
        path = config.sops.secrets."git_config/thor".path;
        condition = "hasconfig:remote.*.url:ssh://git@thor.enseirb-matmeca.fr:2222/**";
      }
    ];
    settings = {
      init.defaultBranch = "main";
      commit.verbose = true;

      core = {
        editor = "nvim";
        exludesFile = "${config.xdg.configHome}/git/ignore";
      };

      merge = {
        tool = "nvimdiff";
        conflictstyle = "diff3";
        ff = false;
      };

      pull.rebase = false;

      mergetool = {
        nvimdiff = {
          prompt = false;
          keepBackup = false;
        };
        prompt = false;
        # nvimdiff.layout = "LOCAL,BASE,REMOTE / MERGED";
        keepBackup = false;
      };

      diff.algorithm = "histogram";
      rerere.enabled = true;
    };
  };
}
