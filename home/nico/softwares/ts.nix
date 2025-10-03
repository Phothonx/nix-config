{pkgs, ...}: {
  home.packages = with pkgs; [
    teamspeak5_client
    # teamspeak3
  ];
}
