{config, ...}: {
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
    ignores = [ "*~" "*.swp" ];
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

      merge.tool = "nvimdiff";
      merge.conflictstyle = "zdiff3";
      merge.ff = false;

      diff.algorithm = "histogram";
      rerere.enabled = true;
    };
  };
}
