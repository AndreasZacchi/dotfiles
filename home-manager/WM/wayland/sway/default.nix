{ pkgs, ... }:
let
    modKey = "Mod4";
    terminal = "alacritty";
    menu = "rofi -show drun -show-icons";
    #background = "any.png";
in {
    imports =
    [ 
        ../mako
        ../waybar
        ../swaylock
        ../../rofi.nix
    ];
    
    wayland.windowManager.sway = {
        enable = true;
        #checkConfig = false; # Temporary workaround for background file not found
        wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
        config = {
            modifier = "${modKey}";
            floating.modifier = "${modKey}";

            terminal = "${terminal}"; 
            menu = "${menu}";

            input = {
                "*" = {
                    xkb_layout = "dk";
                };
            };

            # output = {
            #     #"*" = { bg = "${background} fit #1d2021"; };
            #     "*" = { bg = "#1d2021 solid_color"; };
            #     DP-1 = {
            #         position = "0 0";
            #     };
            #     DP-3 = {
            #         position = "1920 0";
            #     };
            # };

            defaultWorkspace = "workspace number 1";

            bars = [{
                command = "waybar";
            }];
            startup = [
                # Notification daemon
                { command = "mako"; }
            ];
            window.titlebar = false;
  

            # default workspaces for certain applications
            assigns = {
                "workspace number 1" = [{ class = "^[Cc]ode$"; }];
                "workspace number 2" = [{ app_id = "^[Ff]irefox$"; }];
                "workspace number 3" = [{ app_id = "^[Aa]lacritty$"; }];
                "workspace number 4" = [{ class = "^[Dd]iscord$"; }];
                "workspace number 5" = [{ class = "^[Ss]potify$"; }];
            };

            keybindings = {
                "${modKey}+Escape" = "exec swaylock";
                "${modKey}+c" = "kill";
                "${modKey}+h" = "focus left";
                "${modKey}+j" = "focus down";
                "${modKey}+k" = "focus up";
                "${modKey}+l" = "focus right";
                "${modKey}+Left" = "focus left";
                "${modKey}+Down" = "focus down";
                "${modKey}+Up" = "focus up";
                "${modKey}+Right" = "focus right";
                "${modKey}+Shift+h" = "move left";
                "${modKey}+Shift+j" = "move down";
                "${modKey}+Shift+k" = "move up";
                "${modKey}+Shift+l" = "move right";
                "${modKey}+Shift+Left" = "move left";
                "${modKey}+Shift+Down" = "move down";
                "${modKey}+Shift+Up" = "move up";
                "${modKey}+Shift+Right" = "move right"; 
                "${modKey}+r" = "mode resize";       

                "${modKey}+f" = "fullscreen toggle";
                "${modKey}+Shift+space" = "floating toggle";
                "${modKey}+Shift+c" = "reload";
                "${modKey}+Shift+r" = "restart";       

                "${modKey}+Return" = "exec ${terminal} -o font.size=12";
                "${modKey}+b" = "exec firefox";
                "${modKey}+p" = "exec ${menu}";
                "${modKey}+Shift+f" = "exec thunar";
                "${modKey}+Shift+g" = "exec firefox https://github.com/AndreasZacchi?tab=repositories";
                "${modKey}+v" = "exec zsh -c 'source ~/.zshrc && code'";
                "${modKey}+Alt+s" = "exec grim -g \"$(slurp -d)\" /home/$USER/Pictures/$(date).png"; # Save screenshot to file with date
                "${modKey}+Shift+s" = "exec grim -g \"$(slurp -d)\" - | wl-copy -t image/png"; # Save screenshot to clipboard

                "${modKey}+1" = "workspace number 1";
                "${modKey}+2" = "workspace number 2";
                "${modKey}+3" = "workspace number 3";
                "${modKey}+4" = "workspace number 4";
                "${modKey}+5" = "workspace number 5";
                "${modKey}+6" = "workspace number 6";
                "${modKey}+7" = "workspace number 7";
                "${modKey}+8" = "workspace number 8";
                "${modKey}+9" = "workspace number 9";
                "${modKey}+0" = "workspace number 10";

                "${modKey}+Shift+1" = "move container to workspace number 1";
                "${modKey}+Shift+2" = "move container to workspace number 2";
                "${modKey}+Shift+3" = "move container to workspace number 3";
                "${modKey}+Shift+4" = "move container to workspace number 4";
                "${modKey}+Shift+5" = "move container to workspace number 5";
                "${modKey}+Shift+6" = "move container to workspace number 6";
                "${modKey}+Shift+7" = "move container to workspace number 7";
                "${modKey}+Shift+8" = "move container to workspace number 8";
                "${modKey}+Shift+9" = "move container to workspace number 9";

                # Toggle deafen
                "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
                # Toggle mute
                "XF86AudioMute+Ctrl" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle && ffmpeg -y -f lavfi -i 'sine=frequency=200:duration=0.1' /tmp/sound.ogg && play /tmp/sound.ogg";
                # Raise sink (speaker, headphones) volume
                "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +2%";
                # Lower sink (microphone) volume
                "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -2%";
                # Spotify
                ## Play/pause spotify
                "XF86AudioPlay" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
                ## Play previous spotify track
                "XF86AudioPrev" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";
                "XF86Launch5" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";
                ## Play next spotify track
                "XF86AudioNext" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";
                "XF86Tools" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";

            };
        };
  };
}