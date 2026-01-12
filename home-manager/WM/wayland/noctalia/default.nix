{ pkgs, inputs, lib, ... }:
{
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = lib.mkForce {
      enable = true;
      settings = {
        bar = {
          position = "top";
          widgets = {
            left = [
              {
                id = "Launcher";
              }
              {
                id = "Workspace";
              }
            ];
            center = [
              {
                id = "ActiveWindow";
              }
            ];
            right = [
              {
                id = "Tray";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "Battery";
              }
              {
                id = "Volume";
              }
              {
                id = "Brightness";
              }
              {
                id = "Clock";
              }
              {
                id = "ControlCenter";
              }
            ];
          };
        };
        location = {
          name = "Knabstrup";
        };
        appLauncher = {
          terminalCommand = "alacritty";
        };
        controlCenter = {
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
      };
    };
}