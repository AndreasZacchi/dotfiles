{pkgs, ...}: 
{
    stylix = {
        enable = true;
        #autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        #base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    };
}