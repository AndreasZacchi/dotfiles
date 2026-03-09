{pkgs, ...}:
{
    powerManagement.enable = true;
    services = {
        thermald.enable = true; # prevent overheating on intel by thottling
        upower.enable = true; # battery stats
        power-profiles-daemon.enable = false; # power profiles not used when tlp-pd is enabled
        tlp = {
            enable = true;
            settings = {
                PCIE_ASPM_ON_BAT = "powersupersave";
            };
            pd.enable = true; # Power profiles Daemon integration
        };
    };

    # Try to disable screenpad as a display.
    boot.kernelParams = [
    "asus_wmi.fnlock_default=0"
    "asus_wmi.disable_backlight=1"
    ];
    boot.blacklistedKernelModules = [ "asus_nb_wmi" ];
    # Aggresive disable (might break fn keys etc.)
    #boot.blacklistedKernelModules = [ "asus_wmi" ]; 
}