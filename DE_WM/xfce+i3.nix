{ pkgs, ... }:

{
  # Enable i3 with xfce as DE
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
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status 
        i3blocks 
        rofi
    ];

    configFile = ../dotfiles/i3/config;
  };
  };
  services.displayManager.defaultSession = "xfce+i3";
}