{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.kitty = inputs.wrappers.wrappers.kitty.wrap {
      inherit pkgs;

      runtimePkgs = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      settings = with self.theme; {
        shell = lib.getExe self'.packages.shell;
        # FONTS
        "font_family" = "JetBrainsMono Nerd Font";
        font_size = 11;

        underline_hyperlinks = "always";

        # input_delay = 8;
        # repaint_delay = 2;
        # sync_to_monitor = false;
        # wayland_enable_ime = false;

        cursor = base07;
        cursor_text_color = "background";
        cursor_shape = "beam";
        cursor_beam_thickness = "1.8";
        cursor_shape_unfocused = "unchanged";

        copy_on_select = "yes";

        enable_audio_bell = "no";

        remember_window_size = "no";
        window_padding_width = "10";
        hide_window_decorations = "yes";
        confirm_os_window_close = "0";

        notify_on_cmd_finish = "unfocused 10";

        foreground = base05;
        background = base00;

        selection_foreground = "none";
        selection_background = base01;

        color0 = base11;
        color8 = base03;

        color1 = base08;
        color9 = base12;

        color2 = base0B;
        color10 = base14;

        color3 = base0A;
        color11 = base13;

        color4 = base0D;
        color12 = base16;

        color5 = base0E;
        color13 = base17;

        color6 = base0C;
        color14 = base15;

        color7 = base06;
        color15 = base07;
      };

      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+shift+c" = "copy_to_clipboard";

        "ctrl+plus" = "increase_font_size";
        "ctrl+minus" = "decrease_font_size";
        "ctrl+equal" = "restore_font_size";
      };
    };
  };
}
