{ pkgs, ... }:
let
    modKey = "Mod4";
    background = "any.png";
in {
    imports =
    [ 
        ../mako
        ../waybar
    ];
    
    wayland.windowManager.sway = {
        enable = true;
        checkConfig = false; # Temporary workaround for background file not
        wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
        config = {
            modifier = "${modKey}";
            floating.modifier = "${modKey}";

            terminal = "alacritty"; 
            menu = "wofi --show run";

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
                "workspace number 1" = [{ class = "^Code$"; }];
                "workspace number 2" = [{ class = "^Firefox$"; }];
                "workspace number 3" = [{ class = "^Alacritty$"; }];
                "workspace number 4" = [{ class = "^Discord$"; }];
                "workspace number 5" = [{ class = "^Spotify$"; }];
            };

            keybindings = {
                "Mod4+c" = "kill";
                "Mod4+h" = "focus left";
                "Mod4+j" = "focus down";
                "Mod4+k" = "focus up";
                "Mod4+l" = "focus right";
                "Mod4+Left" = "focus left";
                "Mod4+Down" = "focus down";
                "Mod4+Up" = "focus up";
                "Mod4+Right" = "focus right";
                "Mod4+Shift+h" = "move left";
                "Mod4+Shift+j" = "move down";
                "Mod4+Shift+k" = "move up";
                "Mod4+Shift+l" = "move right";
                "Mod4+Shift+Left" = "move left";
                "Mod4+Shift+Down" = "move down";
                "Mod4+Shift+Up" = "move up";
                "Mod4+Shift+Right" = "move right"; 
                "Mod4+r" = "mode resize";       

                "Mod4+f" = "fullscreen toggle";
                "Mod4+Shift+space" = "floating toggle";
                "Mod4+Shift+c" = "reload";
                "Mod4+Shift+r" = "restart";       

                "Mod4+Return" = "exec alacritty -o font.size=12";
                "Mod4+b" = "exec firefox";
                "Mod4+p" = "exec rofi -show drun -show-icons";
                "Mod4+Shift+f" = "exec thunar";
                "Mod4+Shift+g" = "exec firefox https://github.com/AndreasZacchi?tab=repositories";
                "Mod4+v" = "exec zsh -c 'source ~/.zshrc && code'";


                "Mod4+1" = "workspace number 1";
                "Mod4+2" = "workspace number 2";
                "Mod4+3" = "workspace number 3";
                "Mod4+4" = "workspace number 4";
                "Mod4+5" = "workspace number 5";
                "Mod4+6" = "workspace number 6";
                "Mod4+7" = "workspace number 7";
                "Mod4+8" = "workspace number 8";
                "Mod4+9" = "workspace number 9";
                "Mod4+0" = "workspace number 10";

                "Mod4+Shift+1" = "move container to workspace number 1";
                "Mod4+Shift+2" = "move container to workspace number 2";
                "Mod4+Shift+3" = "move container to workspace number 3";
                "Mod4+Shift+4" = "move container to workspace number 4";
                "Mod4+Shift+5" = "move container to workspace number 5";
                "Mod4+Shift+6" = "move container to workspace number 6";
                "Mod4+Shift+7" = "move container to workspace number 7";
                "Mod4+Shift+8" = "move container to workspace number 8";
                "Mod4+Shift+9" = "move container to workspace number 9";

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