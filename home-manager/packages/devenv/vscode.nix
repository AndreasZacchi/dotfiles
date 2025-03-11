{pkgs, ...}:
{
    home.packages = with pkgs; [
        vscode.fhs # using the FHS version of vscode to be able to use the extensions without declaring them in the nix file
    ];
}