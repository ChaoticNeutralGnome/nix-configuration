{config, pkgs, ... }:  {

   programs.git = {
        enable = true;
        settings = {
            user = {
                name = "Fia";
                email = "38019116+ChaoticNeutralGnome@users.noreply.github.com";
            };
        };
    }; 
    
}