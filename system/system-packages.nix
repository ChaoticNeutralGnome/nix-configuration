{ config, pkgs, pkgs-unstable, ... }: {

    programs = {
        zsh.enable = true;
        firefox.enable = true;
        steam = {
            enable = true;
        };
    };

    environment.systemPackages = with pkgs; [
        vim
        vivaldi
        sourcegit
        discord
        fastfetch
        texmaker
        texliveFull
    ];

}