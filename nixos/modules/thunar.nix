{config, pkgs, ...}:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };
  programs.xfconf.enable = true; # To save thunar preferences
  programs.file-roller.enable = true;
}