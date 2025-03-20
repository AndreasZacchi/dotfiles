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
                    command = "swaylock";
                }

                {
                    timeout = 190;
                    command = "swaymsg 'output * dpms off'";
                    resumeCommand = "swaymsg 'output * dpms on'";
                }

                    {
                    timeout = 195;
                    command = "systemctl suspend";
                }
            ];
            events = [
                {
                    event = "before-sleep";
                    command = "swaylock";
                }
            ];
        };
    };
}