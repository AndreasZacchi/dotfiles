{config, pkgs, ...}:
{
    boot.kernelModules = [ "nouveau" ];

    # Blacklist the proprietary NVIDIA driver, if needed
    boot.blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];

    # Enable hardware acceleration for Nouveau
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            mesa
            vaapiVdpau
            libvdpau
            libva
        ];
    };

    # Help prevent issues with Firefox and Nouveau
    environment.sessionVariables = {
        MOZ_WEBRENDER = "1";
        MOZ_ACCELERATED = "1";
        MOZ_X11_EGL = "1";
    };
}