{
    description = "NixOS Flake Configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }: 
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system; 
        };
        pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {
                inherit system;
                modules = [ 
                    ./system
                    ./hardware/desktop.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.fia = import ./home-manager/default.nix;
                    }
                ];
                specialArgs = {
                    inherit pkgs-unstable;
                };
            };
        };
    };
}
