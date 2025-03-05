{ pkgs, ... }:
{
  home.packages = [ pkgs.wl-clipboard ];
  services.clipse = {
    enable = true;
  };
}
