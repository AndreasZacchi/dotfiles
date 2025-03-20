{config, ...}:
{
    boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8852au ];
}