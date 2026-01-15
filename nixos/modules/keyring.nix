{ pkgs, lib, config, ... }: 
{
  # Install necessary packages for keyring
  environment.systemPackages = with pkgs; [
    pkgs.gnome-keyring
    libsecret
    pkgs.seahorse
    pkgs.gnupg
    pcsclite
    libfido2
    opensc
    ccid
    pam_u2f
  ];

  services.udev.packages = [ pkgs.yubikey-personalization pkgs.yubikey-manager pkgs.libu2f-host pkgs.libfido2 ];
  services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;

  #Enable keyring
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security.pam = {
    services = {
      login.enableGnomeKeyring = true;
      swaylock.enableGnomeKeyring = true;
      greetd.enableGnomeKeyring = true;
      login.u2fAuth = false;
      sudo.u2fAuth = false;
      swaylock.u2fAuth = false;
      polkit-1.u2fAuth = false;
      greetd.u2fAuth = false;
    };
    u2f = {
      enable = true;
      settings = {
        control = "sufficient";
        authfile = "/etc/u2f_keys";
        interactive = true;
        cue = true;
        origin = "pam://picokey";
        appid = "pam://picokey";

        pinverification = true;
      };
    };
  };

  services.dbus.enable = true;
  systemd.user.services.gnome-keyring-daemon.wantedBy = [ "default.target" ];

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryPackage = pkgs.pinentry-curses;
  # };
}
