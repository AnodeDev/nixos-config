{
  config,
  lib,
  pkgs,
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
      theme = "catppuccin-mocha";
      wayland.enable = if config.sddm.enableWayland then true else false;
      package = pkgs.kdePackages.sddm;
    };
  };
}
