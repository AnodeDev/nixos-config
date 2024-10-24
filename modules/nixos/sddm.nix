{
  config,
  lib,
  ...
}:

{
  options.sddm = {
    enable = lib.mkEnableOption "enables sddm";
    enableWayland = lib.mkEnableOption "enables wayland support";
  };

  config = lib.mkIf config.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      theme = "catppuccin-sddm-corners";
      wayland.enable = if config.sddm.enableWayland then true else false;
    };
  };
}
