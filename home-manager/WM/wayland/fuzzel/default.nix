{ lib, config, ... }:
{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "Inter:size=12";
                lines = 10;
                width = 40;
            };

            colors = {
                background = "${config.lib.stylix.colors.base00}ff";
                text       = "${config.lib.stylix.colors.base05}ff";
                prompt     = "${config.lib.stylix.colors.base0D}ff";
                match      = "${config.lib.stylix.colors.base0D}ff";
                selection  = "${config.lib.stylix.colors.base02}ff";
                border     = "${config.lib.stylix.colors.base0D}ff";
            };

            border = {
                width = 2;
                radius = 8;
            };
        };
    };

}