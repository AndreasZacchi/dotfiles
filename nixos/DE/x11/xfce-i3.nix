{config, pkgs, ...}:
{
    services.xserver = {
        enable = true;   
        desktopManager = {
            xterm.enable = false;
            xfce = {
                enable = true;
                thunarPlugins = [ pkgs.xfce.thunar-archive-plugin ];
                noDesktop = true;
                enableXfwm = false;
            };
        };
        xkb = {
            layout = "dk";
            variant = "";
        };
        windowManager.i3.enable = true;
  };
}