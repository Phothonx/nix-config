{ pkgs, lib, ... }:
{
  systemd.user.services = {
    cliphist = {
      Unit.Description = "Clipboard history service";
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${lib.getExe pkgs.cliphist} store";
        Restart = "always";
      };
    };  
    wl-clip-persist = {
      Unit.Description = "Persistent clipboard for Wayland";
      Service = {
        ExecStart = "${lib.getExe pkgs.wl-clip-persist} --clipboard both";
        Restart = "always";
      };
    };
  };
}