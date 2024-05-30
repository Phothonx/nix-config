{ ... }:
{
  programs.zsh = {
    # initExtraFirst = '''';
    initExtra = ''
      ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

      ZSH_AUTOSUGGEST_STRATEGY=(completion)

      while read -r option; do
        setopt $option
      done <<-EOF
      ALWAYS_TO_END
      MENU_COMPLETE
      AUTO_LIST
      COMPLETE_IN_WORD
      NOTIFY
      AUTO_CD
      AUTO_PUSHD
      PUSHD_IGNORE_DUPS
      PUSHD_SILENT
      CORRECT
      EOF
    '';
  
    # initExtraBeforeCompInit = '''';
    completionInit = ''
      s_comp_options+=(globdots)

      # MODULES
      zmodload zsh/complist

      # LOAD
      autoload -U colors
      colors

      # COMPLETION CONTAIN
      zstyle ':completion:*' completer _extensions _complete _approximate
      zstyle ':completion:*' complete true
      zstyle ':completion:*' complete-options true

      # CACHE
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

      # MATCHING
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' keep-prefix true

     # MENU / GROUPS
      zstyle ':completion:*' menu select

      # files
      zstyle ':completion:*:*:*:*:default' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' file-sort modification
    '';
  };
}
