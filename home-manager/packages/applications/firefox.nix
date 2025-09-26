{
    programs.firefox = {
        enable = true;

        profiles.default = {
            isDefault = true;  # match the name you used above
            settings = {
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;  # REQUIRED
                # Optional helpers:
                #"layout.css.prefers-color-scheme.content-override" = 0; # 0=follow system, 2=force dark
            };
        };

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
}