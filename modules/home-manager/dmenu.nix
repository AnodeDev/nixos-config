{ config, pkgs, inputs, lib, ... }:
let dmenu = pkgs.dmenu.override(
{
    patches = [
        ./dmenu-patches/dmenu-center-20240616-36c3d68.diff
        ./dmenu-patches/dmenu-linesbelowprompt-and-fullwidth-20211014.diff
    ];
});
in
{
    imports = [ inputs.home-manager.nixosModules.default ];
    options.dmenu = {
        enable =
            lib.mkEnableOption "enables dmenu";
    };

    config = lib.mkIf config.dmenu.enable {
        home.packages = [ dmenu ];
    };
}
