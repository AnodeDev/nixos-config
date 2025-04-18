{
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./hyprlock.nix
    ./rules.nix
    ./settings.nix
    ./workspaces.nix

    ../../../services/wayland/hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
