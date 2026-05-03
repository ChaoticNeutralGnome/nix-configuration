{pkgs, inputs, ...} : {

    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        mutableExtensionsDir = true;

        profiles.default = { 
            userSettings = {
                "workbench.colorTheme" = "Selene Selenized Light";
            };
        
            extensions = with pkgs.vscode-marketplace; [
                bbenoist.nix # Nix Language 
                santoso-wijaya.helios-selene # Selenized Theme
            ];
        };
    };
}