{ config, pkgs, ... }:

{
  imports =
   [
      ./common.nix
      ./WM/wayland/sway/desktop.nix
   ];
}

