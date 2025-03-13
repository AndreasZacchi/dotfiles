{ config, pkgs, ... }:
{
  imports =
    [ 
      # Import modules
      ./modules/keyring.nix
      ./modules/grub.nix
      ./modules/locale.nix
      ./modules/sound.nix
      ./modules/bitwarden.nix
      ./modules/thunar.nix

      # Set Desktop Environment
      #./DE/x11/xfce-i3.nix
      ./DE/wayland/sway.nix
    ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andreaszacchi = {
    isNormalUser = true;
    description = "AndreasZacchi";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
