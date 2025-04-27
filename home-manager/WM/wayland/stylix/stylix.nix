{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        cursor = {
            name = "BreezeX-RosePine-Linux";
            package = pkgs.rose-pine-cursor;
            size = 24;
        };
        iconTheme.enable = true;
        iconTheme.name = "rose-pine-icons";
        iconTheme.package = pkgs.rose-pine-icon-theme;
    }
}