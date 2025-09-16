{
    programs.firefox = {
        enable = true;

        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value= true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "always";
        };
    };
    stylix.targets.firefox.profileNames = [ "default" ];
}