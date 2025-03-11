{ pkgs, ... }: 
{
  # Install necessary packages for keyring
  environment.systemPackages = with pkgs; [
    pkgs.gnome-keyring
    libsecret
    pkgs.seahorse
  ];

  #Enable keyring
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
