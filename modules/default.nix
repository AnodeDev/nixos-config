{ lib, ... }:

{
  imports = [
    ./nixos/bspwm.nix
    ./nixos/picom.nix
    ./nixos/xserver.nix
    ./nixos/main-user.nix
  ];

  xserver.enable = lib.mkDefault true;
  bspwm.enable = lib.mkDefault true;
  picom.enable = lib.mkDefault true;
}
