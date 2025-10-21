{config, pkgs, ...}: 
{
    home.packages = with pkgs; [
		git
		gh
	];
    programs.git = {
        enable = true;
        userName = "Andreas V. W. Zacchi";
        userEmail = "zacchiandreas@gmail.com";
        signing.format = "openpgp";
        signing.signByDefault = true;
    };
    programs.gh.enable = true;
}