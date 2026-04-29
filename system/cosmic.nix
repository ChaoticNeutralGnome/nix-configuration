{ config, pkgs, ... }: { 

    # Enable the COSMIC Desktop Environment.
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    services.system76-scheduler.enable = true;

    # Use Wayland for Chromium/Electron Applications
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}