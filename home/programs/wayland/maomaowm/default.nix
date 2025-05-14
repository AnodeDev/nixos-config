{pkgs, inputs, ...}: {
  imports = [
    ./settings.nix

    ../../../services/wayland/swww.nix
  ];

  wayland.windowManager.maomaowm = {
    enable = true;
  };
}
