{config, pkgs, ...}:
{
    # boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8852au ];
    # boot.kernelPackages = pkgs.linuxPackages_6_12; # Stuck on 6.12 for rtl8852au support for now


    hardware.enableRedistributableFirmware = true;
    boot.kernelPackages = pkgs.linuxPackages_latest; # Realtek support linux >= 6.19 with in-kernel driver
    hardware.usb-modeswitch.enable = true;
    services.udev.extraRules = ''
        # Realtek 8852AU TP-Link - CD mode → WiFi
        ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 0bda -p 1a2b -K"
    '';
}