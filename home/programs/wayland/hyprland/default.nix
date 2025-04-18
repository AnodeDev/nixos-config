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
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
