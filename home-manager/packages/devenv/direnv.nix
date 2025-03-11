{
    programs.direnv = { # Primarily used to load nix enviroment inside vscode
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
    };
}