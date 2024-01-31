{ ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      mode = "";
    };

    theme = "Catppuccin-Mocha";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
        linux_display_server = "wayland";
        wayland_titlebar_color = "background";
        
        modify_font = "underline_position +2";
        # "underline_thickness 140%"

        cursor_blink_interval = "0";
        cursor_beam_thickness = "1.7";

        window_padding_width = "15";
        
        clear_all_shortcuts = "yes";
        confirm_os_window_close  = "0";

        background_opacity  = "0.6";
    };
  };    
}