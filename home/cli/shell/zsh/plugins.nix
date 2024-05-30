{ pkgs, ... }:
{
  programs.zsh.plugins = with pkgs; [
    {
      name = "vi-mode";
      src = zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
  ];
}
