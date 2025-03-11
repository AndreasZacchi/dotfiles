{
    programs.alacritty = {
        enable = true;
        # custom settings
        settings = {
            env.TERM = "xterm-256color";
            font = {
                size = 15;
            };
            scrolling.multiplier = 5;
            selection.save_to_clipboard = true;
        };
    };
}