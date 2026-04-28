{ config, pkgs, ... }: {

    home.packages = with pkgs; [
        atool
        httpie
    ];

}