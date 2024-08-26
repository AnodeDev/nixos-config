    { config, pkgs, lib, ... }:

{
    options.sway = {
        enable =
            lib.mkEnableOption "enables sway";
    };

    config = lib.mkIf config.river.enable {
        environment.systemPackages = with pkgs; [
            waybar
            swaybg
        ];

        programs.sway = {
            enable = true;
        };
    };
}
