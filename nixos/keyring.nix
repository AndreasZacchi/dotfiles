{ pkgs, ... } : {
    # Install necessary packages for keyring
    environment.systemPackages = with pkgs; [
     gnome.gnome-keyring
     libsecret
     gnome.seahorse
  ];

  #Enable keyring
  services.gnome.gnome-keyring.enable = true;
}