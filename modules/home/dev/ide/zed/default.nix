{
  config,
  lib,
  ...
}: let
  cfg = config.programs.zed-editor;
  inherit (lib) mkIf;
in {
  config.programs.zed-editor = mkIf cfg.enable {
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
