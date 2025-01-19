{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.bash;
in {
  config = mkIf cfg.enable {
    programs.bash.shellAliases = with pkgs; {
      # To temporarily bypass an alias, we preceed the command with a \
      # EG: the ls command is aliased, but to use the normal ls command you would type \ls

      # Add an "alert" alias for long running commands.  Use like so:
      #   sleep 10; alert
      alert = "notify-send --urgency=low -i \"$([ $? = 0 ] && echo terminal || echo error)\" \"$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')\"";

      # alias to show the date
      da = "date \"+%Y-%m-%d %A %T %Z\"";

      # Alias's to modified commands
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -iv";
      mkdir = "mkdir -pv";
      ps = "ps auxf";
      ping = "ping -c 10";
      less = "less -R";
      vi = "vim";
      svi = "sudo vi";
      nv = "nvim";

      # Change directory aliases
      "cd.." = "cd ..";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # cd into the old directory
      bd = "cd \"$OLDPWD\"";

      # Remove a directory and all files
      rmd = "rm --recursive --force --verbose ";

      # Alias's for multiple directory listing commands
      la = "eza -Al"; # show hidden files
      ll = "eza -l --group-directories-first"; # simple listing
      ls = "eza"; # add colors and file type extensions
      lx = "eza -l --sort=extention "; # sort by extension
      lk = "eza -l --sort=size"; # sort by size
      lc = "eza -l --sort=changed"; # sort by change time
      lu = "eza -l --sort=accessed"; # sort by access time
      lr = "eza -lR"; # recursive ls
      lt = "eza -l --sort=created"; # sort by date
      labc = "eza -la --sort=name"; #alphabetical sort
      lf = "eza -lf"; # files only
      ldir = "eza -lD"; # directories only

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

      # Count all files (recursively) in the current folder
      countfiles = "for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null";

      # To see if a command is aliased, a file, or a built-in command
      checkcommand = "type -t";

      # Show current network connections to the server
      ipview = "netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'";

      # Show open ports
      openports = "netstat -nape --inet";

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
