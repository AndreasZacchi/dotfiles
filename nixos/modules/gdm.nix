{ pkgs, ... }:
{
    services.xserver = { # Maybe not needed?
        enable = true;
    };

    services = {
        displayManager = {
            gdm = {
                enable = true;
                wayland = true;
            };
        };
        desktopManager.gnome.enable = true;
    };

    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [ 
        gnome-tour 
        gnome-user-docs 
        gnome-contacts 
        gnome-maps
        gnome-weather
        gnome-music
        gnome-console
        nautilus
    ];
}