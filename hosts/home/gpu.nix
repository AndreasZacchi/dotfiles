{  config, pkgs, ... }:
{
    boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia_uvm" ];
    boot.blacklistedKernelModules = [ "nouveau" ];

    hardware.graphics = {
        enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        open = true;
        powerManagement.enable = true;
    };

    environment.sessionVariables = {
        GBM_BACKEND = "nvidia-drm";
        __GL_SYNC_TO_VBLANK = "1";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        WLR_NO_HARDWARE_CURSORS = "1";
        GDK_BACKEND = "wayland";
        QT_QPA_PLATFORM = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
    };
}
