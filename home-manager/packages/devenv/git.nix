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
    };
    programs.gh.enable = true;
}