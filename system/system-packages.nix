{ config, pkgs, pkgs-unstable, ... }: {

    nixpkgs.config.allowUnfree = true;

    programs = {
        zsh.enable = true;
        firefox.enable = true;
        steam.enable = true;
    };

    environment.systemPackages = with pkgs; [
        vim
        vivaldi
        floorp-bin
        vscodium
        sourcegit
        discord
        fastfetch
    ];

}