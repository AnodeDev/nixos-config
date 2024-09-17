{ config, pkgs, lib, ... }:
let dmenu = pkgs.dmenu.override(
{
    patches = [
        ./dmenu-patches/dmenu-center-20240616-36c3d68.diff
        ./dmenu-patches/dmenu-linesbelowprompt-and-fullwidth-20211014.diff
    ];
});
in
{
    imports = [
        ../../modules/home-manager/cleanup.nix
        ../../modules/home-manager/unfree.nix
        ../../modules/home-manager/variables.nix
    ];

    # =============== GENERAL =============== #

    home.username = "dexter";
    home.homeDirectory = "/home/dexter";

    home.packages = [
        # PACKAGES

        # Useful
        pkgs.brave
        pkgs.btop
        pkgs.tree
        pkgs.ripgrep
        pkgs.xdg-ninja
        pkgs.gnupg
        pkgs.pinentry
        pkgs.pass
        pkgs.protonmail-bridge
        pkgs.neomutt
        pkgs.openssl_3_3
        pkgs.offlineimap
        pkgs.w3m
        pkgs.mailcap
        dmenu

        # Programming
        pkgs.rustup
        pkgs.gcc
        pkgs.go

        # Misc
        pkgs.freetube
        pkgs.vesktop
        pkgs.steam
        pkgs.spotify
        pkgs.oh-my-posh
        pkgs.fzf

        # Theming
        pkgs.bibata-cursors
        pkgs.sweet
        pkgs.candy-icons
        pkgs.xbanish

        # Fonts
        (pkgs.nerdfonts.override { fonts = [ "Iosevka" "0xProto" ]; })
    ];

    unfree = {
        enable = true;
        steam = true;
        spotify = true;
    };

    variables = {
        enable = true;
        xdg = true;
        cleaning = true;
        languages = true;
        nvim = true;
        kitty = true;
    };

    home.file = {
        "${config.xdg.dataHome}/icons/default".source =
            "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

    # =============== HOME DIRECTORY =============== #

    home.activation.cleanup =
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            rm -rf ~/.gnupg
            rm -f ~/.gtkrc-2.0
            rm -rf ~/.icons
            rm -rf ~/.compose-cache
            rm -rf ~/.nix-defexpr
            rm -rf ~/.nix-profile
            rm -rf ~/.pki
            rm -rf ~/.ssh
            rm -rf ~/.w3m
            rm -rf ~/.wine
            rm -f ~/.zcompdump
        '';

    # =============== CONFIGS =============== #

    programs = {
        git = {
            enable = true;
            userName = "Dexter Hedman";
            userEmail = "dexterhedman05@proton.me";

            ignores = [ "*~" "*.swp" ];
            extraConfig = {
                init.defaultBranch = "main";
                pull.rebase = false;
            };
        };

        neovim = {
            enable = true;
            defaultEditor = true;
        };


        bat.enable = true;
        zoxide.enable = true;
        fzf.enable = true;
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
