{
  description = "My NixOS configuration";

  outputs =
    {
      nixpkgs,
      ... 
    }@inputs:
    let
      lib = import "${nixpkgs}/lib";
    in
    {
      nixosConfigurations.dexter = nixpkgs.lib.nixosSystem {
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
          overlays = [ (import inputs.rust-overlay) ];
        };
        modules = [
          ./hosts/dexter/configuration.nix
          ./modules
          ./system
          inputs.home-manager.nixosModules.home-manager
          inputs.nvf.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
    };

  inputs = {
    # IMPORTANT!
    systems.url = "github:nix-systems/default-linux";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # The rest, in alphabetical order
    eww = {
      url = "github:elkowar/eww";
      inputs = {
        nixkpgs.follows = "nixpkgs";
        rust-overlay.follows ="rust-overlay";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprutils.follows = "hyprland/hyprutils";
        hyprlang.follows = "hyprland/hyprlang";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
