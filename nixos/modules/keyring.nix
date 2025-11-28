{ pkgs, lib, ... }: 
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
  ];

  services.udev.packages = [ pkgs.yubikey-personalization ];
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
      swaylock.u2fAuth = true;
      polkit-1.u2fAuth = true;
      greetd.u2fAuth = true;
    };
    u2f = {
      enable = true;
      settings = {
        interactive = true;
        cue = true;
        authfile = pkgs.writeText "u2f-mappings" ''
          andreaszacchi:8dACAmHQv7wijkhqRIvT37tZgkC6w8b86ezyRoIE7QRzvZ+EJ6M58tOPJNra8Whbyq0F0jB7WNTXfg+t3f7UVkAs3UxXoEP9K/Ob5ZtQEyZLeXDqyE8Y2mtABoADnjlMFrcS1M3MGEUzlv35muWxitWjSKu6vpoeouMvp2D4NLVCh1yaypIl8ZmmVHM4/6VyV72psfYN4nlXzIQ/wFaO9yVVPPMeakBfbaHO6vvo6OHRPdiMTeQ+ue6U,97VsRlCwGzZ67T5EWpVuLzm9L326ff8sgjqE85lS0t6DT5EKdi2kMFvLqG1O6gKFYzQddBGRnAhE57JA7Lm6tQ==,es256,+presence:8dACAgkgO8tqr0iWBs1FwqK0jC2Nu7qnSWiDYIg3Nma1nWIS/0ZIsh5ZG6+OqOWmdZ7cgRYbUqUYhBa0wNHjVotLKRob5yIxYSIBYemzH1iEupnhPgxn30QCZS2A1bYYJSqkeP3DyYg2jHpoopndosPbPRgJFU8iKzAGuS9ZfHVyJZN3/3fo4c9Xsy1k2CCsJ5lTN9jV1WbEv3MJJ/Q6h33yGjw5scqFA6NCG1BRtvpTlR1cuEKMmQ==,zenjcYRBvbND6Pe+AhbLkA29p6DLu51y5uPcPfIpiTEk2VN7mz2RKAMv0Zxlr/5vMSt+N4TrOlfuRTEUWj57Ow==,es256,+presence
        '';
      };
    };
  };

  services.dbus.enable = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryPackage = pkgs.pinentry-curses;
  # };
}
