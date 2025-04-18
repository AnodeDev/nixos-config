{pkgs, ...}: {
  imports = [
    ./settings.nix
  ];

  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
  };
}
