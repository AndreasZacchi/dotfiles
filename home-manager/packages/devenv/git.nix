{config, pkgs, ...}: 
{
    home.packages = with pkgs; [
		git
		gh
	];
    programs.git = {
        enable = true;
        settings.user = {
            name = "Andreas V. W. Zacchi";
            email = "zacchiandreas@gmail.com";
        };
        signing.format = "openpgp";
        signing.signByDefault = true;
    };
    programs.gh.enable = true;
    programs.lazygit.enable = true;
}