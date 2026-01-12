{ pkgs, ... }:{
    home.packages = [
        pkgs.adwaita-cursor-theme
    ];


    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        cursor = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
            size = 24;
        };
        iconTheme = {
            enable = true;
            name = "Adwaita-dark";
            package = pkgs.adwaita-icon-theme;
        };
        polarity = "dark";
    };
    
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark";
        };
        gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
        gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
    };
}