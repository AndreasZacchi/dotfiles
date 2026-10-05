{ inputs, ... }:
{
    imports = [
        inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
        enable = true;

        settings = {
            theme = {
                mode = "dark";
            };
            dock = {
                enabled = true;
                icon_size = 32;
                auto_hide = true;
                reserve_space = false;
            };
            control_center = {
                calendar = {
                    show_week_numbers = true;
                };
            };
            location = {
                auto_locate = true;
            };
            bar.default = {
                start = [
                    "launcher"
                    "workspaces"
                ];

                center = [
                    "clock"
                ];

                end = [
                    "tray"
                    "notifications"
                    "clipboard"
                    "network"
                    "bluetooth"
                    "volume"
                    "brightness"
                    "battery"
                    "control-center"
                    "session"
                ];
                };
        };
    };
}