{self, ...}: {
  flake.nixosModules.nico = {
    pkgs,
    config,
    lib,
    ...
  }: {
    users.mutableUsers = false;

    users.users.nico = {
      shell = pkgs.bashInteractive;
      hashedPasswordFile = config.age.secrets.psswd_nico.path;
      # initialPassword = "12345";
      isNormalUser = true;
      group = "users";
      extraGroups = [
        "audio"
        "network"
        "video"
        "gamemode"
        "wheel"
        "networkmanager"
        "input"
        "dialout"
      ];
    };

    # https://wiki.nixos.org/wiki/Fish
    programs.fish.enable = true;
    programs.fish.package = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

    programs.bash.interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.shell} $LOGIN_OPTION
      fi
    '';

    environment.persistence."/persist".users.nico = {
      directories = [
        "Downloads"
        "Music"
        "Dev"
        "Desktop"
        "Pictures"
        "Documents"
        "Videos"
        "wiki"
        "nix-config"

        { directory = ".ssh"; mode = "0700"; }

        ".cache/fish"
        ".cache/mozilla"
        ".cache/noctalia"

        ".local/state/wireplumber"
        ".local/share/Steam"
        ".local/share/osu"
        ".local/share/albiononline"
        ".local/share/zoxide"
        ".local/share/direnv"
        ".local/share/nvim"
        ".local/share/fish"
        ".local/share/nautilus"

        ".config/mozilla"
        ".config/mozilla/firefox"
        ".config/heroic"
        ".config/chromium"
        ".config/nvim"
        ".config/obs-studio"
        # ".config/discord"
        ".config/Bitwarden"
        ".config/spotify"
        ".config/vesktop"
        ".config/localsend"
        ".config/unity3d"
      ];
      files = [
        ".local/share/applications/albion.desktop"
      ];
    };
  };
}
