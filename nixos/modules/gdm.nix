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

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gnome
        ];
    };


}