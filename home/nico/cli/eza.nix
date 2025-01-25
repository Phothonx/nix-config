{...}: {
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    extraOptions = [
      "--icons=always"
      "--git"
      "--group-directories-first"
      "--header"
    ];
  };
}
