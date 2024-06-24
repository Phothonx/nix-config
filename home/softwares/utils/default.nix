{ colors, pkgs, ... }:
{
  home.packages = with pkgs; [


    # Filemanager
    gnome.nautilus # nemo when adw-gtk support it ( #cope :) )
    gnome.nautilus-python
    nautilus-open-any-terminal
    gnome.sushi # Nautilus previewer

    # Doc viewer
    evince 

    # Video mpv frontend
    celluloid

    # AUdio player 
    amberol

    # Image viewer
    loupe
  ];

  programs = with colors; {
    imv = {
      enable = true;
      settings = {
        options.background = base11;
        aliases.x = "close";
      };
    };

    zathura = {
      enable = true;
      mappings = {
        "" = "navigate next";
        D = "toggle_page_mode";
        "[fullscreen] " = "zoom in";
      };
      options = {
        default-bg = "#${base11}";
        default-fg = "#${base07}";
      };
    };
  };
}
