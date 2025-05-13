{pkgs, ...}: {
  imports = [
    ./settings.nix

    ../../../services/wayland/swww.nix
  ];

  home.packages = with pkgs; [
    mako
  ];

  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
  };
}
