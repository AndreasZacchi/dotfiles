{pkgs, ...}:
{
    services = {
        swayidle = {
            enable = true;
            timeouts = [
                { 
                    timeout = 180;
                    command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
                }

                {
                    timeout = 185;
                    command = "${pkgs.swaylock}/bin/swaylock";
                }

                {
                    timeout = 190;
                    command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
                    resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
                }

                    {
                    timeout = 195;
                    command = "systemctl suspend";
                }
            ];
            events = {
                before-sleep = "${pkgs.swaylock}/bin/swaylock";
            };
        };
    };
}