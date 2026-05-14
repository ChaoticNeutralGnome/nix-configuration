{
    description = "NixOS Flake Configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-vscode-extensions = {
            url = "github:nix-community/nix-vscode-extensions";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        cosmic-manager = {
            url = "github:HeitorAugustoLN/cosmic-manager";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };
        rust-overlay.url = "github:oxalica/rust-overlay";
    };

    outputs = { 
        self, 
        nixpkgs, 
        home-manager, 
        ... 
    } @ inputs: 
    let
        system = "x86_64-linux";
        overlays = [
            (import ./overlays/unstable.nix {inherit inputs; })
            inputs.firefox-addons.overlays.default
            inputs.nix-vscode-extensions.overlays.default
            inputs.rust-overlay.overlays.default
        ];
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
            inherit system overlays;
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {
                inherit system;
                modules = [
                    {
                        nixpkgs.config.allowUnfree = true;
                        nixpkgs.overlays = overlays;
                    }
                    ./system
                    ./hardware/desktop.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.fia = { 
                            imports = [
                                ./home-manager/default.nix
                                inputs.cosmic-manager.homeManagerModules.cosmic-manager
                            ];
                        };
                        home-manager.extraSpecialArgs = {
                            inherit inputs overlays;
                        };
                    }
                ];
                specialArgs = {
                    inherit inputs overlays;
                };
            };
        };
        devShells.${system} = 
            import ./dev/default.nix {
                inherit pkgs;
            };
    };
}
