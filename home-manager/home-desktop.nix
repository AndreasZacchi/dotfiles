{ inputs, config, pkgs, ... }:

{
  imports =
   [
      ./common.nix
      #./WM/wayland/sway/desktop.nix
      ./WM/wayland/niri/desktop.nix
   ];
}

