{pkgs, ...}:
{
    home.packages = with pkgs; [
		neofetch
		nnn # terminal file manager
        powertop # power management
        htop # system monitor

		# archives
		zip
		unzip

		which
		file
	];
}