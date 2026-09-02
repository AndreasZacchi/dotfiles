{pkgs, ...}:
{
     environment.systemPackages = [
        pkgs.devenv
    ];
    nix.settings.trusted-users = [
        "root"
        "andreaszacchi"
    ];
}