{ config, pkgs, ... }:

{
  imports =
   [
      ./common.nix
      ./WM/wayland/sway/laptop.nix
   ];
}

