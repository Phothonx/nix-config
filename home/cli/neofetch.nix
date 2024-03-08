{ pkgs, ... }:
{
  home.packages = [ pkgs.neofetch ];
  home.file.".config/neofetch/config.conf".text = ''
   print_info() {
    prin "$(color 0)┌─────────────────────────────────┐"
    info "\e[34m  " distro
    info "\e[36m " packages
    info "\e[31m " kernel
    info "\e[33m󰒓 " cpu
    info "\e[33m󰍛 " memory
    info "\e[32m " term
    info "\e[35m " de
    prin "$(color 0)└──────────────── $(color 10) $(color 1) $(color 2) $(color 3) $(color 4) $(color 5) $(color 6) $(color 15) $(color 0)┘"
   }

   distro_shorthand="on"
   os_arch="off"

   kernel_shorthand="on"

   package_managers="on"

   memory_percent="off"
   memory_unit="mib"

   de_version="on"

   image_backend="kitty"
   image_source="$HOME/.dotfiles/wallpapers/nix-logo.png"
   crop_mode="normal"
   crop_offset="center"
   image_size="220px"
   yoffset=0
   xoffset=0
   gap = 2

   package_managers="on"

    cpu_temp="C"
    memory_percent="on"
  '';
}