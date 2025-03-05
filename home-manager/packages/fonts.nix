{config, pkgs, ...}: 
{
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
        # Fonts
        font-awesome
        powerline-fonts
        powerline-symbols
    ];
}