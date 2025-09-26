{
    services.mako = {
        enable = true;
        settings = {
            # layout & size
            border-radius = 12;
            max-visible = 5;
            width = 400;
            height = 150;
            margin = "20,40,20,40";  # top,right,bottom,left
            padding = "12";

            icons = true;

            # behavior
            default-timeout = 4000; # ms
            ignore-timeout = true;  # critical notifications stay until dismissed
            sort = "-time";        # newest on top
            layer = "overlay";     # stays above other surfaces
        };
    };
}