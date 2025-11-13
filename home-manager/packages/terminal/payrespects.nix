{pkgs, ...}:{
    programs.pay-respects = {
        enable = true;
        enableBashIntegration = true;
    };

    home.packages = with pkgs; [
        nix-search-cli
    ];
}