{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "zsh-syntax-highlighting"
        "zsh-autosuggestions"
      ];
    };

    shellAliases = {
      "avaBuild" = "cd ~/.dotfiles && sudo nixos-rebuild switch --flake .#avalon";
    };
    shellGlobalAliases = {};
  };
}