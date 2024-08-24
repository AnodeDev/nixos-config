{ config, pkgs, lib, ... }:

{
    options.sddm = {
        enable =
            lib.mkEnableOption "enables sddm";
    };

    config = lib.mkIf config.sddm.enable {
        services.displayManager.sddm = {
            enable = true;
            theme = "catppuccin-sddm-corners";
        };
    };
}
