{ pkgs, lib, isLaptop, ... }:
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

    # Apply user monitor settings to login screenby copying the user's monitors.xml to GDM's config directory
    systemd.services.applyUserMonitorSettings = lib.mkIf (!isLaptop) (
        let
            username = "andreaszacchi";
            gdmConfigDir = "/var/lib/gdm/seat0/config";
        in {
            description = "Apply user monitor settings to GDM login screen";
            after = [ "network.target" "systemd-user-sessions.service" "display-manager.service" ];
            wantedBy = [ "multi-user.target" ];

            serviceConfig = {
            Type = "oneshot";
            ExecStart = "${pkgs.bash}/bin/bash -c 'echo \"Applying user monitor settings to GDM login screen\" && mkdir -p ${gdmConfigDir} && echo \"Created ${gdmConfigDir} directory\" && [ \"/home/${username}/.config/monitors.xml\" -ef \"${gdmConfigDir}/monitors.xml\" ] || cp /home/${username}/.config/monitors.xml ${gdmConfigDir}/monitors.xml && echo \"Copied monitors.xml to ${gdmConfigDir}/monitors.xml\" && chown gdm:gdm ${gdmConfigDir}/monitors.xml && echo \"Changed ownership of monitors.xml to gdm\"'";
            };
        }
    );
}