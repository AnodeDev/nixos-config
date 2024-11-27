{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      ... 
    }@inputs:
    let
      lib = import "${nixpkgs}/lib";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        pkgs = import nixpkgs {
          config = {
            allowUnfree = true;
            allowUnfreePredicate = pkg:
              builtins.elem (lib.getName pkg) [
                "steam-unwrapped"
                "steam"
                "steam-run"
                "steam-original"
              ];
          };
          system = "x86_64-linux";
          overlays = [
            (import inputs.rust-overlay)
          ];
        };
        modules = [
          ./hosts/default/configuration.nix
          ./modules/default.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}
