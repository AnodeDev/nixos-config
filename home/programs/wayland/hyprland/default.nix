{
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    withUWSM = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
