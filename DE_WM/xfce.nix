{ pkgs, ... }:

{
  # Enable xfce DE
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
      };
    };
    desktopManager = {
      xfce = {
        enable = true;
      };
    };
    xkb = {
      layout = "dk";
      variant = "";
    };
  };

  services.displayManager.defaultSession = "xfce+i3";
}