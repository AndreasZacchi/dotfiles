{...}:
{
    programs.librewolf = {
        enable = true;
        # Enable WebGL, cookies and history
        settings = {
            "webgl.disabled" = false;
            "privacy.clearOnShutdown.history" = false;
            "privacy.clearOnShutdown.cookies" = false;
            "network.cookie.lifetimePolicy" = 0;
        };
        profiles.andreaszacchi = {
            isDefault = true;
            settings = {
                "layout.css.prefers-color-scheme.content-override" = 2;
            };
        };
    };
    stylix.targets.librewolf = {
        enable = true;
        profileNames = [ "andreaszacchi" ];
    };
}