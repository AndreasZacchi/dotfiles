{ pkgs, ... } : {
    # Install necessary packages for keyring
    environment.systemPackages = with pkgs; [
     bitwarden-cli
  ];
}
