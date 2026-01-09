{ inputs, pkgs, ... }:
{
    imports = [
        inputs.dms.homeModules.dank-material-shell
        #inputs.dms.homeModules.niri
        inputs.danksearch.homeModules.default
    ];

    programs.dank-material-shell = {
        enable = true;
        #niri = {
        #    enableKeybinds = true;   # Sets static preset keybinds # Not recommened with includes enabled (Default)
        #    enableSpawn = true;      # Auto-start DMS with niri and cliphist, if enabled
        #};
        systemd.enable = true;


        enableSystemMonitoring = true;     # System monitoring widgets (dgop)
        #enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
        #enableCalendarEvents = true;       # Calendar integration (khal)

        quickshell.package = inputs.quickshell.packages.x86_64-linux.default;
    };

    programs.dsearch = {
        enable = true;
        
        config = {
            listen_addr = ":43654";
            max_file_bytes = 5242880;  # 5MB
            worker_count = 8;
            
            index_paths = [
                {
                    path = "~/Documents";
                    max_depth = 0;  # No limit
                    exclude_hidden = false;
                    exclude_dirs = [ ];
                }
                {
                    path = "~/workspace";
                    max_depth = 8;
                    exclude_hidden = true;
                    exclude_dirs = [ "node_modules" "venv" "target" ".git" "dist" "build" ];
                }
            ];
        };
    };

    # DMS specific dependencies
    home.packages = with pkgs; [
      libnotify # needed for certain dms plugins to send desktop notifications
      #dgop      # system monitoring widgets
      cliphist  # clipboard history manager
    ];
}