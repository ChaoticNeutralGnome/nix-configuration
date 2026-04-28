{ config, pkgs, ... }: { 

    # Enable the COSMIC Desktop Environment.
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    services.system76-scheduler.enable = true;

    # Disable Variable Refresh Rate
    environment.sessionVariables = {
        COSMIC_DISABLE_VRR = "1";
    };

    # Use Wayland for Chromium/Electron Applications
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}