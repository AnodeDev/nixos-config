{ pkgs, lib, ... }:

{
    imports = [
        ./nixos/bspwm.nix
        ./nixos/picom.nix
        ./nixos/sddm.nix
        ./nixos/xserver.nix
        ./nixos/main-user.nix
        ./home-manager/dmenu.nix
    ];

    xserver.enable =
        lib.mkDefault true;
    bspwm.enable =
        lib.mkDefault true;
    picom.enable =
        lib.mkDefault true;
    sddm.enable =
        lib.mkDefault true;
    dmenu.enable = 
        lib.mkDefault true;
}
