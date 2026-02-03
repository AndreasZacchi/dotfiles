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
}