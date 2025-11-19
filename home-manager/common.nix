{ config, pkgs, ... }:
{
	imports =
	[
		# General
		./packages/fonts.nix

		# WM/DE
		#./WM/i3.nix
		./WM/wayland/sway

		# Dev environment
		./packages/devenv/git.nix
		./packages/devenv/direnv.nix
		./packages/devenv/vscode.nix
		./packages/devenv/gpg.nix

		./packages/devenv/languages/python3.nix
		./packages/devenv/languages/dotnet.nix
		./packages/devenv/languages/java.nix
		

		./packages/devenv/postgresql.nix
		
		# TexLive
		./packages/tex.nix

		# Terminal
		./packages/terminal/alacritty.nix
		./packages/terminal/bash.nix
		./packages/terminal/starship.nix
		./packages/terminal/tools.nix
		./packages/terminal/payrespects.nix

		# Applications
		./packages/applications/spotify.nix
		./packages/applications/discord.nix
		./packages/applications/firefox.nix
	];

	home.username = "andreaszacchi";
	home.homeDirectory = "/home/andreaszacchi";
	home.keyboard.layout = "da";

	# This value determines the home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new home Manager release introduces backwards
	# incompatible changes.
	#
	# You can update home Manager without changing this value. See
	# the home Manager release notes for a list of state version
	# changes in each release.
	home.stateVersion = "23.05";

	# Let home Manager install and manage itself.
	programs.home-manager.enable = true;
}
