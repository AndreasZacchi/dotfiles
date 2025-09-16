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
        ];
    };
}