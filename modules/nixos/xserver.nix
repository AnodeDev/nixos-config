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
      xkb.layout = "se";
      xkb.options = "eurosign:e";
    };
  };
}
