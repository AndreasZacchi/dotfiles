{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
   enable = true;
    config = {
      modifier = "Mod4";
      floating.modifier = "Mod4";
      
      # default workspaces for certain applications
      assigns = {
        "1" = [{ class = "^Code$"; }];
        "2" = [{ class = "^Firefox$"; }];
        "3" = [{ class = "^Alacritty$"; }];
        "4" = [{ class = "^Discord$"; }];
        "5" = [{ class = "^Spotify$"; }];
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
      };
    };
  };
}