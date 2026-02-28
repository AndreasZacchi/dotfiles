{config, pkgs, ...}:
{
    boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8852au ];
    hardware.usb-modeswitch.enable = true;
    boot.kernelPackages = pkgs.linuxPackages_6_12; # Stuck on 6.12 for rtl8852au support for now
}