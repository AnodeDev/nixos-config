{ config, pkgs, lib, ... }:
{
    options.unfree = {
        enable =
            lib.mkEnableOption "enable unfree";
        steam =
            lib.mkEnableOption "enable steam";
        spotify =
            lib.mkEnableOption "enable spotify";
    };

    config = lib.mkIf config.unfree.enable {
        lib.mkIf config.unfree.steam {
            nixpkgs.config.allowUnfreePredicate = pkg:
                builtins.elem (lib.getName pkg) [
                    "steam"
                    "steam-original"
                    "steam-run"
                ];
        };

        lib.mkIf config.unfree.spotify {
            nixpkgs.config.allowUnfreePredicate = pkg:
                builtins.elem (lib.getName pkg) [
                    "spotify"
                ];
        };
    };
}
