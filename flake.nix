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
      nixosConfigurations.hex = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        pkgs = import nixpkgs {
          config = {
            allowUnfree = true;
            allowUnfreePredicate = pkg:
              builtins.elem (lib.getName pkg) [
                "obsidian"
                "steam-unwrapped"
                "steam"
                "steam-run"
                "steam-original"
              ];
          };
          system = "x86_64-linux";
          overlays = [
            (import inputs.rust-overlay)
            inputs.zig-overlay.overlays.default
          ];
        };
        modules = [
          ./hosts/hex/configuration.nix
          ./modules
          ./system
          inputs.home-manager.nixosModules.home-manager
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

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprutils.follows = "hyprland/hyprutils";
        hyprlang.follows = "hyprland/hyprlang";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
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

    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
