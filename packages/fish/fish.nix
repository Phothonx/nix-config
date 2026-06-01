{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: let
    fishConf = pkgs.writeText "wrapped-config.fish" ''
      set -g fish_color_option blue
      set fish_greeting

      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_replace underscore
      set -g fish_cursor_external line
      set -g fish_vi_force_cursor 1

      alias ls '${lib.getExe pkgs.eza} --icons=always --git --group-directories-first --header'
      alias cd 'z'
      alias cp 'cp --verbose'
      alias mv 'mv --verbose'
      alias rm 'rm --interactive=once --verbose'
      alias mkdir 'mkdir --parents --verbose'

      abbr -a -p anywhere -- -h --help
      abbr -a -- .. 'cd ..'
      abbr -a -- ... 'cd ../..'
      abbr -a -- .... 'cd ../../..'

      abbr -a -- nf 'nix flake'
      abbr -a -- np 'nix profile'
      abbr -a -- nt 'nh os test'
      abbr -a -- ns 'nh os switch'
      abbr -a -- nr 'sudo nixos-rebuild switch --flake $FLAKE#avalon'
      abbr -a -- nfu 'nix flake update'
      abbr -a -- nd 'nix develop --command fish'
      abbr -a -- ndb 'nix flake check --show-trace'
      abbr -a -- nfs 'nix flake show'
      abbr -a -- npl 'nix profile list'
      abbr -a -- npr 'nix profile remove'
      abbr -a -- ne 'echo $IN_NIX_SHELL'
      abbr -a --set-cursor npi 'nix profile add nixpkgs#%'
      abbr -a --set-cursor nsh 'nix shell nixpkgs#% --command fish'

      abbr -a gs 'git status'
      abbr -a gau 'git add --update'
      abbr -a gf 'git fetch'
      abbr -a gm 'git merge'
      abbr -a gmt 'git mergetool'
      abbr -a gc 'git commit'
      abbr -a gaa 'git add --all'
      abbr -a gpo 'git push --set-upstream origin'
      abbr -a gl 'git log --oneline --all --graph'
      abbr -a gb 'git branch'
      abbr -a --set-cursor gcm 'git commit --message "%"'

      abbr -a ps 'ps auxf'
      abbr -a ping 'ping -c 10'
      abbr -a less 'less -R'
      abbr -a vi 'vim'
      abbr -a svi 'sudo vi'
      abbr -a nv 'nvim'

      abbr -a mx 'chmod a+x'
      abbr -a 000 'chmod -R 000'
      abbr -a 644 'chmod -R 644'
      abbr -a 666 'chmod -R 666'
      abbr -a 755 'chmod -R 755'
      abbr -a 777 'chmod -R 777'

      abbr -a h 'history | grep '
      abbr -a p 'ps aux | grep '
      abbr -a f 'find . | grep '

      abbr -a diskspace 'du -S | sort -n -r | more'
      abbr -a folders 'du -h --max-depth=1'
      abbr -a folderssort 'find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
      abbr -a tree 'tree -CAhF --dirsfirst'
      abbr -a treed 'tree -CAFd'
      abbr -a mountedinfo 'df -hT'

      abbr -a mktar 'tar -cvf'
      abbr -a mkbz2 'tar -cvjf'
      abbr -a mkgz 'tar -cvzf'
      abbr -a untar 'tar -xvf'
      abbr -a unbz2 'tar -xvjf'
      abbr -a ungz 'tar -xvzf'

      abbr -a sc 'sudo systemctl'
      abbr -a jc 'sudo journalctl'
      abbr -a scu 'systemctl --user'
      abbr -a jcu 'journalctl --user'
      abbr -a kys 'shutdown now'

      ${lib.getExe pkgs.zoxide} init fish | source

      if type -q direnv
        ${lib.getExe pkgs.direnv} hook fish | source
      end

      function fish_prompt --description 'Write out the prompt'
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status
        set -l normal (set_color normal)
        set -q fish_color_status
        or set -g fish_color_status red

        set -l color_cwd $fish_color_cwd
        set -l suffix '>'
        if functions -q fish_is_root_user; and fish_is_root_user
          if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
          end
          set suffix '#'
        end

        set -l bold_flag --bold
        set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
        if test $__fish_prompt_status_generation = $status_generation
          set bold_flag
        end
        set __fish_prompt_status_generation $status_generation
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color $bold_flag $fish_color_status)
        set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n "<nix-shell> "
          end
        )

        set -l fhs_env_info (
          if test -n "$FHS"
            echo -n (set_color brred)"<fhs-env> "
          end
        )

        echo -n -s $fhs_env_info $nix_shell_info (prompt_login)' ' (set_color $color_cwd) "["(prompt_pwd)"]" $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
      end
    '';
  in {
    packages.fish = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.fish;
      runtimePkgs = with pkgs; [
        zoxide
        eza
        direnv
        nh

        self'.packages.git
        self'.packages.neovim
      ];
      flags = {
        "-C" = "source ${fishConf}";
      };
    };
  };
}
