{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.picom = {
    enable = lib.mkEnableOption "enables picom";
  };

  config = lib.mkIf config.picom.enable {
    systemd.user.services.picom = {
      enable = true;
      after = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = lib.mkDefault "${pkgs.picom-pijulius}/bin/picom --config /home/dexter/.config/WindowManagement/picom/picom.conf";
        Restart = "always";
      };
      wantedBy = [ "default.target" ];
    };
  };
}
