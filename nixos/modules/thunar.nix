{config, pkgs, ...}:
{
  services.gvfs.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
    ];
  };
  programs.xfconf.enable = true; # To save thunar preferences
  programs.dconf.enable = true;  # To save thumbnail settings
 # programs.file-roller.enable = true;

  # Add thumbnail support
  environment.systemPackages = with pkgs; [
    ffmpeg-headless
    ffmpegthumbnailer
    gdk-pixbuf
    libheif
    libheif.out
    tumbler
  ];

}
