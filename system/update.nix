{ config, pkgs, ... }: {

    systemd.services.nixos-upgrade.environment = {
        GIT_AUTHOR_NAME = "NixOS Auto-upgrade";
        GIT_AUTHOR_EMAIL = "root@nixos";
        GIT_COMMITTER_NAME = "NixOS Auto-upgrade";
        GIT_COMMITTER_EMAIL = "root@nixos";
    };

    system.autoUpgrade = {
        enable = true;
        flake = "/home/fia/flake/";
        flags = [
            "--update-input" "nixpkgs"
            "--print-build-logs"
            "--commit-lock-file"  
        ];
        dates = "weekly";
        randomizedDelaySec = "45min";
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };

}