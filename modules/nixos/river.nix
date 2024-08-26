{ config, pkgs, lib, ... }:

{
    options.river = {
        enable =
            lib.mkEnableOption "enables river";
    };

    config = lib.mkIf config.river.enable {
        environment.systemPackages = with pkgs; [
            waybar
            swaybg
        ];

        programs.river = {
            enable = true;
        };
    };
}
