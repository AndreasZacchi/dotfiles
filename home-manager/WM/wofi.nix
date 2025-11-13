{ config, pkgs, ... }:
{
    programs.wofi.enable = true;
    programs.wofi.settings = {
        show = "drun";
        allow_images=true;
        term = "alacritty";
        insensitive=true;
    };
}