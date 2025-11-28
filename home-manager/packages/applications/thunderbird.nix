{ pkgs, ... }:
{
    programs.thunderbird = {
        enable = true;
        profiles.andreaszacchi = {
            isDefault = true;
        };
    };
}