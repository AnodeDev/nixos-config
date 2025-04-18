{pkgs, ...}: {
  imports = [
    ./settings.nix

    ../../../services/wayland/swww.nix
  ];

  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
  };
}
