{ inputs, config, pkgs, ... }:

{
    imports = [
        inputs.dms.nixosModules.greeter
    ];

    programs.dank-material-shell.greeter = {
        enable = true;
        compositor.name = "niri";

        configHome = "/home/andreaszacchi/";

        logs = {
            save = true; 
            path = "/tmp/dms-greeter.log";
        };
    };

    security.pam.services.greetd = {
        u2fAuth = false;
    };



    services.dbus.packages = [
      pkgs.greetd
    ];

}