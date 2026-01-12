{ config, pkgs, ... }:

{
  imports =
   [
      ./common.nix
      #./WM/wayland/sway/laptop.nix
      ./WM/wayland/niri/laptop.nix
   ];
}

