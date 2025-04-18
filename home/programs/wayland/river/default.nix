{pkgs, ...}: {
  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
  };
}
