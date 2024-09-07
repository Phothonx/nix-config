{ lib, config, inputs, pkgs, ... }:
with lib;
let
  cfg = config.system.agenix;
in
{
  imports = [ inputs.agenix.nixosModules.default ];

  options.system.agenix = {
    enable = mkEnableOption "Enable agenix secrets management";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ inputs.agenix.packages.${pkgs.system}.default ];
    age.secrets.secret1.file = ./../../../secrets/secret1.age;
    age.identityPaths = [ 
      "/etc/ssh/ssh_host_ed25519_key"
      "/home/nico/.ssh/id_ed25519"
    ];
  };
}
