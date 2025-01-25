{
  config,
  lib,
  ...
}:

{
  options.xserver = {
    enable = lib.mkEnableOption "enables xserver";
  };

  config = lib.mkIf config.xserver.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.options = "eurosign:e";
      videoDrivers = [ "amdgpu" ];
      serverFlagsSection = ''
        Option "BlankTime" "0"
        Option "StandbyTime" "0"
        Option "SuspendTime" "0"
        Option "OffTime" "0"
      '';
    };
  };
}
