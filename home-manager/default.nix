{config, pkgs, ... }: {

    home.username = "fia";
    home.homeDirectory = "/home/fia";

    programs.home-manager.enable = true;

    home.shellAliases = {
        ".." = "cd ..";
        "code" = "codium";
    };

    imports = [
        ./user-pakages.nix
        ./git.nix
        ./zsh.nix
        ./firefox.nix
        ./vscode.nix
        ./cosmic.nix
    ];

    home.stateVersion = "25.11";
}
