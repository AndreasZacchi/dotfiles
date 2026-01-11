{
    powerManagement.enable = true;
    services = {
        thermald.enable = true; # prevent overheating on intel by thottling
        upower.enable = true; # battery stats
        power-profiles-daemon.enable = true; # power profiles
    };
}