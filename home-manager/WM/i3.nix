{ config, pkgs, ... }:
let
    modKey = "Mod4";
    terminal = "alacritty";
    menu = "rofi -show drun -show-icons";
in {
	imports =
	[ 
		../rofi.nix
	];
	
	xsession.windowManager.i3 = {
	enable = true;
		config = {
			modifier = "${modKey}";
			floating.modifier = "${modKey}";
			
			# default workspaces for certain applications
			assigns = {
				"1" = [{ class = "^[Cc]ode$"; }];
				"2" = [{ class = "^[Ff}irefox$"; }];
				"3" = [{ class = "^[Aa]lacritty$"; }];
				"4" = [{ class = "^[Dd]iscord$"; }];
				"5" = [{ class = "^[Ss]potify$"; }];
			};
		
			keybindings = {
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
			};
		};
	};
}