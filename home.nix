{ config, pkgs, ... }:

{
    home.username = "fia";
    home.homeDirectory = "/home/fia";

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;

    home.packages = [
        pkgs.atool
        pkgs.httpie
    ];

    home.shellAliases = {
        ".." = "cd ..";
        "code" = "codium";
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh.enable = true;
        oh-my-zsh.theme = "robbyrussell";
    };
    
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "Fia";
                email = "38019116+ChaoticNeutralGnome@users.noreply.github.com";
            };
        };
    };

    
}
