{ config, pkgs, lib, ... }:
let dmenu = pkgs.dmenu.override(
{
    patches = [
        ./dmenu-patches/dmenu-caseinsensitive-5.0.diff
        ./dmenu-patches/dmenu-center-20240616-36c3d68.diff
        ./dmenu-patches/dmenu-linesbelowprompt-and-fullwidth-20211014.diff
    ];
});
in
{
    # =============== GENERAL =============== #
    home.username = "dexter";
    home.homeDirectory = "/home/dexter";

    nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
            "steam"
            "steam-original"
            "steam-run"
        ];


    home.packages = [
        # Packages
        dmenu
        pkgs.freetube
        pkgs.vesktop
        pkgs.steam
        pkgs.brave
        pkgs.btop
        pkgs.tree
        pkgs.bibata-cursors
        pkgs.sweet
        pkgs.candy-icons

        # Fonts
        (pkgs.nerdfonts.override { fonts = [ "Iosevka" "0xProto" ]; })
    ];

    home.file = {
        ".icons/default".source =
            "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    # =============== GTK =============== #
    gtk.enable = true;

    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Ice";

    gtk.theme.package = pkgs.nordic;
    gtk.theme.name = "Nordic";

    gtk.iconTheme.package = pkgs.candy-icons;
    gtk.iconTheme.name = "candy-icons";

    # =============== QT =============== #
    qt.enable = true;

    # =============== DON'T TOUCH! =============== #
    home.stateVersion = "24.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
