{ ... }:
{
  imports = [
    ./aliases.nix
    ./init.nix
    ./plugins.nix
  ];

  programs.bash.enable = false;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "regexp" ];
      styles = {"alias" = "fg=magenta";};
    };

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
    };

    history = {
      path = ".config/zsh/zsh_history";
      share = true;
      save = 10000;
      size = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignorePatterns = ["rm *" "pkill *" "kill *"];
    };

    dirHashes = {
      docs = "$HOME/Documents";
      dev = "$HOME/Dev";
      dots = "$HOME/.dotfiles";
      dl = "$HOME/Downloads";
      screenshots = "$HOME/Medias/Screenshots";
      media = "$HOME/Medias";
      vids = "$HOME/Media/Videos";
      music = "$HOME/Media/Music";
      pics = "$HOME/Media/Pictures";
    };
  };
}
