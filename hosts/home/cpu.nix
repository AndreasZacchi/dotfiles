{
    powerManagement.enable = true;
    powerManagement.cpuFreqGovernor = "performance";
    services = {
        thermald.enable = true;
    };
    zramSwap.enable = true;
    zramSwap.memoryPercent = 20;
}