{ lib, ... }:

{
  imports = [
    ./nixos/bspwm.nix
    ./nixos/picom.nix
    ./nixos/sddm.nix
    ./nixos/xserver.nix
    ./nixos/main-user.nix
    ./nixos/hyprland.nix
  ];

  xserver.enable = lib.mkDefault false;
  bspwm.enable = lib.mkDefault false;
  picom.enable = lib.mkDefault false;
  sddm.enable = lib.mkDefault true;
  sddm.enableWayland = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
}
