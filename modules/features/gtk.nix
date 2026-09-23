{
  flake.nixosModules.gtk = {pkgs, ...}: {
    qt = {
      enable = true;
      # platformTheme = "gnome";
    };

    environment = {
      etc = {
        "xdg/gtk-2.0/gtkrc".text = ''
          gtk-icon-theme-name = "Papirus-Dark"
          gtk-theme-name = "Colloid-Teal-Dark-Catppuccin"
        '';
        "xdg/gtk-3.0/settings.ini".text = ''
          [Settings]
          gtk-icon-theme-name = Papirus-Dark
          gtk-theme-name = Colloid-Teal-Dark-Catppuccin
        '';
        "xdg/gtk-4.0/settings.ini".text = ''
          [Settings]
          gtk-icon-theme-name = Papirus-Dark
          gtk-theme-name = Colloid-Teal-Dark-Catppuccin
        '';
      };
    };

    environment.variables.GTK_THEME = "Colloid-Teal-Dark-Catppuccin:dark";
    programs.dconf.enable = true;
    programs.dconf.profiles.user.databases = [
      {
        settings."org/gnome/desktop/interface" = {
          gtk-theme = "Colloid-Teal-Dark-Catppuccin";
          icon-theme = "Papirus-Dark";
          color-scheme = "prefer-dark";
        };
      }
    ];

    environment.systemPackages = with pkgs; [
      (colloid-gtk-theme.override {
        colorVariants = ["dark"];
        sizeVariants = ["standard"];
        themeVariants = ["teal"];
        tweaks = ["rimless" "normal" "catppuccin"];
      })
      papirus-icon-theme

      gtk3
      gtk4
    ];

    fonts = {
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu
        noto-fonts-color-emoji
      ];
      fontconfig.defaultFonts = {
        emoji = ["Noto Color Emoji"];
        serif = ["Ubuntu"];
        sansSerif = ["Ubuntu Nerd Font"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
    };
  };
}
