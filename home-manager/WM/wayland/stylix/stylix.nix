{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        cursor = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
            size = 24;
        };
        iconTheme.enable = true;
        iconTheme.name = "rose-pine-icons";
        iconTheme.package = pkgs.rose-pine;
    }
}