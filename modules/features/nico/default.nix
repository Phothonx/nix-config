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
        "video"
        "gamemode"
        "wheel"
        "networkmanager"
        "input"
        "uinput"
        "dialout"
        "libvirtd"
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

    persist.user.name = "nico";
    persist.user.directories = [
      "wiki"

      ".cache/fish"

      ".local/share/zoxide"
      ".local/share/nvim"
      ".local/share/fish"
      ".local/share/jellyfin-desktop"

      ".config/nvim"
    ];
  };
}
