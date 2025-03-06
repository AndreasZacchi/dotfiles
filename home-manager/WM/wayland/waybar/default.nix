{
    programs.waybar = {
        enable = true;
        style = builtins.readFile ./style.css;
        settings = [{
            layer = "top";
            position = "top";
            exclusive = true;

            modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
            modules-center = [ "sway/window" ];
            modules-right = [ "network" "custom/divider" "bluetooth" "custom/divider" "pulseaudio" "custom/divider" "battery" "custom/divider" "clock" ];

            "battery" = {
                format = "{capacity}% {icon}";
                format-charging = "1{capacity}% ⚡";
                format-icons = [""  ""  ""  ""  ""];
            };
            "clock" = {
                format-alt = "{:%a, %d. %b  %H:%M}";
            };
            "sway/window" = {
                max-length = 50;
            };
            "sway/workspaces" = {
                disable-scroll = true;
                all-outputs = false;
            };

            "wlr/taskbar" = {
                "on-click" = "activate";
            };

            "network" = {
                # "interface" = "wlp2s0"; # (Optional) To force the use of this interface
                "format-wifi" = "{essid} ({signalStrength}%) ";
                "format-ethernet" = "{ifname} = {ipaddr}/{cidr} ";
                "format-disconnected" = "Disconnected ⚠";
                "interval" = 10;
                "on-click" = "nm-connection-editor";
            };
            "bluetooth" = {
                format = "{icon}";
                format-alt = "{status} {icon}";
                interval = 30;
                format-icons = {
                    "enabled" = "";
                    "disabled" = "";
                };
                tooltip-format = "{}";
            };
            "pulseaudio" = {
                #"scroll-step" = 1;
                "format" = "{volume}% {icon}";
                "format-bluetooth" = "{volume}% {icon}";
                "format-muted" = "{volume}% ";
                "format-icons" = {
                    "headphones" = "";
                    "handsfree" = "";
                    "headset" = "";
                    "phone" = "";
                    "portable" = "";
                    "car" = "";
                    "default" = ["" ""];
                };
                "on-click" = "pavucontrol";
            };

            "custom/divider" = {
                format = " | ";
                interval = "once";
                tooltip = false;
            };
        }];
    };
}