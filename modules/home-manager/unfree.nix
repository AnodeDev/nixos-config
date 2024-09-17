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
        nixpkgs.config.allowUnfreePredicate = pkg:
        let
            pkgName = lib.getName pkg;
        in
            builtins.elem pkgName (lib.concatLists [
                (lib.mkIf config.unfree.steam [ "steam" "steam-original" "steam-run" ])
                (lib.mkIf config.unfree.spotify [ "spotify" ])
            ]);
    };
}
