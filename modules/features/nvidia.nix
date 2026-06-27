{
  flake.nixosModules.nvidia = {
    pkgs,
    config,
    ...
  }: {
    services.xserver.videoDrivers = ["nvidia"];

    boot = {
      blacklistedKernelModules = ["nouveau" "nvidiafb" "rivafb"];
      extraModprobeConfig = ''
        options nvidia-drm modeset=1
        options nvidia NVreg_UsePageAttributeTable=1
        options nvidia NVreg_EnablePCIeGen3=1
      '';
      initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
      kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
      kernelParams = [
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      ];
    };

    environment.sessionVariables = {
      # accélération vidéo matérielle via nvidia-vaapi-driver
      NVD_BACKEND = "direct";
      # forcer l'utilisation de la librairie d'accélération matérielle
      # LIBVA_DRIVER_NAME = "nvidia";
    };

    systemd.services = {
      "nvidia-suspend".enable = true;
      "nvidia-resume".enable = true;
      "nvidia-hibernate".enable = true;
    };

    hardware = {
      nvidia-container-toolkit.enable = true;
      nvidia = {
        open = false; # proprietary drivers
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };

      graphics.enable = true;
      graphics.enable32Bit = true;
      graphics.extraPackages = with pkgs; [
        intel-ocl # Generic OpenCL support
        libva-vdpau-driver # Pont VA-API → VDPAU
        libvdpau-va-gl # Accélération VDPAU OpenGL
      ];
    };

    services.lact.enable = true;

    environment.systemPackages = with pkgs; [
      # nvtopPackages.nvidia # nvtop
      # cudaPackages.cudatoolkit
      nvidia-vaapi-driver # Ajoute le driver VA-API pour le décodage vidéo
      vdpauinfo # Outil pour tester VDPAU
      libva-utils # Outils pour tester VA-API
    ];
  };
}
