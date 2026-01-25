{config, pkgs, ...}: 
{
    fonts.fontconfig.enable = true;
    fonts.fontconfig.defaultFonts.monospace = [
        "JetBrainsMono Nerd Font Mono"
    ];


    home.packages = with pkgs; [
        # Fonts
        nerd-fonts.jetbrains-mono
    ];
}