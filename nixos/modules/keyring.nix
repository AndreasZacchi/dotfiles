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
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      swaylock = {
        u2fAuth = true;
        rules.auth.unix.order = config.security.pam.services.swaylock.rules.auth.u2f.order - 10;
      };
      polkit-1.u2fAuth = true;
      greetd.u2fAuth = true;
    };
    u2f = {
      enable = true;
      settings = {
        authfile = "/etc/u2f_keys";
        interactive = true;
        cue = true;
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
