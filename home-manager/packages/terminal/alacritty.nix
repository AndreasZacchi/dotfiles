{ pkgs, lib, config, ... }:
{
    programs.alacritty = {
        enable = true;
        # custom settings
        settings = {
            env.TERM = "xterm-256color";
            font = {
                size = lib.mkForce 12;
            };
            scrolling.multiplier = 5;
            selection.save_to_clipboard = true;
        };
    };
}