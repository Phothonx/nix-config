{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.vscode;
in
{
  config = mkIf cfg.enable {
    programs.vscode = {
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        vscode-icons-team.vscode-icons
      ];
      userSettings = {
        "update.mode" = "none";
        "extensions.autoUpdate" = false;

        "window.menuBarVisibility" = "toggle";
        "editor.fontFamily" = "'FiraCode Nerd Font', 'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'FiraCode Nerd Font'";
        "editor.fontSize" = 16;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "vsicons.dontShowNewVersionMessage" = true;
        "explorer.confirmDragAndDrop" = false;
        "editor.fontLigatures" = true;
        "editor.minimap.enabled" = false;
        "workbench.startupEditor" = "none";

        "editor.formatOnType" = true;
        "files.autoSave" = "onWindowChange";
        "workbench.iconTheme" = "Material Icon Theme";
      };
    };
  };
}
