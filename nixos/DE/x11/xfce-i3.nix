{config, pkgs, ...}:
{
    services.xserver = {
        enable = true;   
        desktopManager = {
            xterm.enable = false;
            xfce = {
                enable = true;
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
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };
}