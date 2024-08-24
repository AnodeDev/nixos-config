{ config, pkgs, lib, ... }:

{
    options = {
        picom.enable =
            lib.mkEnableOption "enables picom";
    };

    config = lib.mkIf config.picom.enable {
        systemd.user.services.picom = {
            description = "Picom compositor service";
            after = [ "graphical-session.target" ];
            wants = [ "graphical-session.target" ];
            serviceConfig = {
                ExecStart = "${pkgs.picom}/bin/picom --config /home/dexter/.config/WindowManagement/picom/picom.conf";
                Restart = "always";
                RestartSec = "1s";
            };
            wantedBy = [ "default.target" ];
        };

        systemd.user.services.picom.enable = true;
    };
}
