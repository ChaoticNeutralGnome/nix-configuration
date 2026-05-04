{ config, lib, cosmicLib, pkgs, ... }: {

    wayland.desktopManager.cosmic = {
      enable = true;

        panels = [
            {
                name = "Panel";
                anchor = cosmicLib.cosmic.mkRON "enum" "Top";
                anchor_gap = false;
                autohide = null;
                background = cosmicLib.cosmic.mkRON "enum" "ThemeDefault";
                expand_to_edges = true;
                margin = 0;
                opacity = 1.0;
                output = cosmicLib.cosmic.mkRON "enum" "All";
                padding = 0;
                
                plugins_center = cosmicLib.cosmic.mkRON "optional"
                    [
                        "com.system76.CosmicAppletTime"
                    ];
                
                plugin_wings = cosmicLib.cosmic.mkRON "optional" (cosmicLib.cosmic.mkRON "tuple" [
                        [
                            "com.system76.CosmicPanelWorkspacesButton"
                            "com.system76.CosmicPanelAppButton"
                        ]
                        [
                            "com.system76.CosmicAppletInputSources"
                            "com.system76.CosmicAppletA11y"
                            "com.system76.CosmicAppletStatusArea"
                            "com.system76.CosmicAppletTiling"
                            "com.system76.CosmicAppletAudio"
                            "com.system76.CosmicAppletBluetooth"
                            "com.system76.CosmicAppletNetwork"
                            "com.system76.CosmicAppletBattery"
                            "com.system76.CosmicAppletNotifications"
                            "com.system76.CosmicAppletPower"
                        ]
                    ]);

                size = cosmicLib.cosmic.mkRON "enum" "XS";
                size_center = cosmicLib.cosmic.mkRON "optional" null;
                size_wings = cosmicLib.cosmic.mkRON "optional" null;
                spacing = 4;
            }  
        ];
    };
}