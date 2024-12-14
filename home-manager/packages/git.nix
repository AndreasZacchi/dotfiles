{config, pkgs, ...}: 
{
    # basic configuration of git, please change to your own
    programs.git = {
        enable = true;
        userName = "Andreas V. W. Zacchi";
        userEmail = "zacchiandreas@gmail.com";
    };
    #programs.git-credential-oauth.enable = true;
    programs.gh.enable = true;
}