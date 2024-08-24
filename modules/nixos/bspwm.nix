{ config, pkgs, lib, ... }:

{
    options.bspwm = {
        enable =
            lib.mkEnableOption "enables bspwm";
    };

    config = lib.mkIf config.bspwm.enable {
        services.xserver.windowManager.bspwm = {
            enable = true;
            configFile = "/home/dexter/.config/WindowManagement/bspwm/bspwmrc";
            sxhkd = {
                configFile = "/home/dexter/.config/WindowManagement/sxhkd/sxhkdrc";
            };
        };
    };
}
