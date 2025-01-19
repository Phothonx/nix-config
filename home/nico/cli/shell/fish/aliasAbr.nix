{
  ...
}:
{
    programs.fish = {
      enable = true;
      # To temporarily bypass an alias, we preceed the command with a \
      # EG: the ls command is aliased, but to use the normal ls command you would type \ls

      shellAliases = {
        # --- Replacements ---
        ls = "eza";
      };

      shellAbbrs = {
        # Change directory aliases
        "cd.." = "cd ..";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";

        # Alias's to modified commands
        cp = "cp -v";
        mv = "mv -v";
        rm = "rm -iv";
        mkdir = "mkdir -pv";
        ps = "ps auxf";
        ping = "ping -c 10";
        less = "less -R";
        vi = "vim";
        svi = "sudo vi";
        nv = "nvim";

        # alias chmod commands
        mx = "chmod a+x";
        "000" = "chmod -R 000";
        "644" = "chmod -R 644";
        "666" = "chmod -R 666";
        "755" = "chmod -R 755";
        "777" = "chmod -R 777";

        # Search command line history
        h = "history | grep ";

        # Search running processes
        p = "ps aux | grep ";

        # Search files in the current folder
        f = "find . | grep ";

        # Alias's to show disk space and space used in a folder
        diskspace = "du -S | sort -n -r |more";
        folders = "du -h --max-depth=1";
        folderssort = "find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn";
        tree = "tree -CAhF --dirsfirst";
        treed = "tree -CAFd";
        mountedinfo = "df -hT";

        # Alias's for archives
        mktar = "tar -cvf";
        mkbz2 = "tar -cvjf";
        mkgz = "tar -cvzf";
        untar = "tar -xvf";
        unbz2 = "tar -xvjf";
        ungz = "tar -xvzf";

        # System
        sc = "sudo systemctl";
        jc = "sudo journalctl";
        scu = "systemctl --user";
        jcu = "journalctl --user";
        kys = "shutdown now";
      };
    };
}
