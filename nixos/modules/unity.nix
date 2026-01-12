{pkgs, ...}:
{
    enviroment.systemPackages = with pkgs; [
        unityhub
    ];
}