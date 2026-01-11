{config, pkgs, ...}: 
{
  # greetd + tuigreet
  services.greetd = {
    enable = true;

    # Nice ncurses greeter
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --cmd 'niri-session'";
        user = "andreaszacchi";
      };
    };
  };

  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}