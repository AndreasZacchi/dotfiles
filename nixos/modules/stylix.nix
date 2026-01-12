{pkgs, ...}: 
{
    stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        cursor = {
            name = "Simp1e-Adw-Dark";
            package = pkgs.simp1e-cursors;
            size = 24;
        };
        icons = {
            enable = true;
            dark = "Adwaita-dark";
            light = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };
        polarity = "dark";
    };
}
