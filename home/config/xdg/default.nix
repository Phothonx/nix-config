{ config, ... }:
{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      createDirectories = true;
      templates = null;
      publicShare = null;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
        XDG_NIXDOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      };
    };
  };
}
