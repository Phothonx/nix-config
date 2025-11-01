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
    settings = {
      init.defaultBranch = "main";
      commit.verbose = true;

      "includeIf \"hasconfig:remote.*.url:git@github.com:*/**\"".path = config.sops.secrets."git_config/github".path;
      "includeIf \"hasconfig:remote.*.url:git@thor.enseirb-matmeca.fr:*/**\"".path = config.sops.secrets."git_config/thor".path;
    };
  };

}
