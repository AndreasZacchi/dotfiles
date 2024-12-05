{ pkgs, ... } : {
    # Install necessary packages for keyring
    environment.systemPackages = with pkgs; [
     pkgs.gnome-keyring
     libsecret
     pkgs.seahorse
  ];

  #Enable keyring
  services.gnome.gnome-keyring.enable = true;
}
