{ pkgs, lib, ... }:

{
    imports = [
        ./nixos/bspwm.nix
        ./nixos/picom.nix
        ./nixos/sddm.nix
        ./nixos/xserver.nix
        ./nixos/main-user.nix
        ./nixos/river.nix
        ./nixos/sway.nix
    ];

    xserver.enable =
        lib.mkDefault true;
    bspwm.enable =
        lib.mkDefault true;
    picom.enable =
        lib.mkDefault true;
    sddm.enable =
        lib.mkDefault true;
    sddm.enableWayland =
        lib.mkDefault false;
    river.enable =
        lib.mkDefault false;
    sway.enable =
        lib.mkDefault false;
}
