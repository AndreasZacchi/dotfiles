{config, pkgs, ...}: 
{
  # greetd + tuigreet
  services.greetd = {
    enable = true;

    # Nice ncurses greeter
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --cmd 'sway --unsupported-gpu'";
        user = "andreaszacchi";
      };
    };
  };
  security.pam.services.greetd = {
    text = ''
      auth     include login
      account  include login
      password include login
      session  include login
    '';
    enableGnomeKeyring = true;
  };
}