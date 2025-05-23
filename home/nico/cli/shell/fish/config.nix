{
  lib,
  pkgs,
  ...
}: {
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    interactiveShellInit = ''
      set -g fish_color_option blue

      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_replace underscore
      set -g fish_cursor_external line

      set -g fish_vi_force_cursor 1
    '';

    functions = {
      fish_greeting = lib.mkDefault "";
    };

    plugins = with pkgs.fishPlugins; [
    ];
  };
}
