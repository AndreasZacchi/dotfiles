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
        origin = "pam://pico";
        authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
          "andreaszacchi"
          ":8dACAlT0kaGPUdF3BNfaTGMxaGXnWbk2ZZ1qVoRO+kCmkA8FuWtMHomyWebjFWW6SJEnKn+ofJY9AgsPgALF/+XIwrt8bEXTJHsxDvHreaut8FioP79+9CA/2elpAtCzh7nFKJPmb5pl2NaK4eSbgRei7E5u95xkfuZ0IIZIqIn3V5KVoUoQg/y45tiH00x97AqCU6Yfq99PrHrkbjNWqonRn8dISgxL5jTV+9R9J3qxuYboSxZSoQ==,5VXiqud4SrGVtLowzhmJhFw0qqYkQ7dDoC/1u4Nl9IeQ+jK8N0qb/hAJaEFiHx3mBHd898gUriZRSko7anuy/g==,es256,+presence"
          ":8dACAqCVf0arA9xnO8w8G4MGyicDB1CuSf4YNffg4+Kecv+hJcvg72O8Yd+l1LKxRluwF0moT33mHgmcJ/MhSRhsuQOlPzrsaNg7rpiwFd7k6H+5PZP/wqzu2xmoK+ThFFdg3RVvqTPkla51t9LymA9EdUuixTDcdr8cgUrmuHNgrDE0Jj/zIlrlsQ5VuqvWg/QCWMX+VLwbuEHl/sSvn0yR6pxZSPkvHN8Eyyk0+FjUr/VQCaW1+g==,zUqQZQ9DeC6m3Gl5/A0HdCBDibblGVo+qSBeWOrAxrz51iGobQNU0K+pbu9PjMaq+EnmARfERZX/tL8EynzFLw==,es256,+presence"
        ]);
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
