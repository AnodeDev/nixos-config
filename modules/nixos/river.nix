{ config, pkgs, lib, ... }:

{
    options.river = {
        enable =
            lib.mkEnableOption "enables river";
    };

    config = lib.mkIf config.river.enable {
        programs.river = {
            enable = true;
        };
    };
}
