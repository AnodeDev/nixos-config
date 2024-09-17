{ lib, ... }:
{
    imports = [
        ./home-manager/unfree.nix
        ./home-manager/variables.nix
    ];
    
    unfree = {
        enable = 
            lib.mkDefault false;
        steam = 
            lib.mkDefault false;
        spotify = 
            lib.mkDefault false;
    };

    variables = {
        enable =
            lib.mkDefault true;
        xdg =
            lib.mkDefault true;
        cleaning =
            lib.mkDefault false;
        nvim =
            lib.mkDefault true;
        kitty =
            lib.mkDefault true;
    };
}
