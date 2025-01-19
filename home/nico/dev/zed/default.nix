{
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "Catppuccin Themes"
      "Ruff"
      "OCaml"
      "LaTeX"
      "Make"
      "Basher"
      "Fish"
    ];

    userKeymaps = {};

    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
