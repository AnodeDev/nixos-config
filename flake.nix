{
    description = "My NixOS configuration";
   
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        picom = {
            url = "github:jonaburg/picom";
            flake = false;
        };
   
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
   
    outputs = { self, nixpkgs, ... }@inputs:
    {
        nixosConfigurations.default = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/default/configuration.nix
                ./modules
                inputs.home-manager.nixosModules.default
            ];
        };
    };
}
