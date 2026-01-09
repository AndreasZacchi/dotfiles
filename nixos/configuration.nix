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
      #./modules/greetd.nix # Sway
      ./modules/xdg.nix

      ./modules/opengl.nix
      ./modules/stylix.nix
      # Set Desktop Environment
      #./DE/wayland/sway.nix # Sway
      ./DE/wayland/niri.nix
      ./modules/dms-greeter.nix

      # Nix optimisations
      ./modules/nix-optimisation.nix
    ];

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 ];
  };

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"

    ];
    trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andreaszacchi = {
    isNormalUser = true;
    description = "AndreasZacchi";
    extraGroups = [ "networkmanager" "wheel" "greeter" ];
  };

  home-manager.backupFileExtension = "backup";

  systemd = {
    # Create a separate slice for nix-daemon that is
    # memory-managed by the userspace systemd-oomd killer
    slices."nix-daemon".sliceConfig = {
      ManagedOOMMemoryPressure = "kill";
      ManagedOOMMemoryPressureLimit = "50%";
    };
    services."nix-daemon".serviceConfig.Slice = "nix-daemon.slice";

    # If a kernel-level OOM event does occur anyway,
    # strongly prefer killing nix-daemon child processes
    services."nix-daemon".serviceConfig.OOMScoreAdjust = 1000;
  };
  services.earlyoom.enable = true;


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
