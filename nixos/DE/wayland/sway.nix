{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    feh # image viewer
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    brightnessctl
    networkmanagerapplet # Network editor GUI
    pavucontrol # Audio Control
  ];

  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      adwaita-icon-theme
    ];
  };
  
  services.xserver.enable = false; # dsiable x server
}
