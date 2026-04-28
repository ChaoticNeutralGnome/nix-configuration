{ config, pkgs, ... }: {

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Define your hostname.
    networking.hostName = "nixos"; 

    # Configure network connections interactively with nmcli or nmtui.
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/New_York";

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Select internationalisation properties
    i18n.defaultLocale = "en_US.UTF-8";

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound.
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    # Define a user account.
    users.users.fia = {
        isNormalUser = true;
        initialPassword = "password";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
        #     tree
        ];
    };

    imports = [
        ./system-packages.nix
        ./update.nix
        ./cosmic.nix
    ];

    system.stateVersion = "25.11";
}