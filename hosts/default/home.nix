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
    # =============== GENERAL =============== #
    home.username = "dexter";
    home.homeDirectory = "/home/dexter";

    nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
            "steam"
            "steam-original"
            "steam-run"
            "spotify"
        ];

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

        # Fonts
        (pkgs.nerdfonts.override { fonts = [ "Iosevka" "0xProto" ]; })
    ];

    home.file = {
        ".icons/default".source =
            "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

    home.sessionVariables = {
        # XDG setup
        XDG_DATA_HOME = lib.mkForce "${config.home.homeDirectory}/.local/share";
        XDG_STATE_HOME = lib.mkForce "${config.home.homeDirectory}/.local/state";
        XDG_CACHE_HOME = lib.mkForce "${config.home.homeDirectory}/.cache";
        XDG_CONFIG_HOME = lib.mkForce "${config.home.homeDirectory}/.config";

        # Home directory cleaning
        GTK2_RC_FILES = lib.mkForce "${config.xdg.configHome}/gtk-2.0/gtkrc";
        XCOMPOSECACHE = lib.mkForce "${config.xdg.cacheHome}/X11/xcompose";
        XCURSOR_PATH = lib.mkForce "/usr/share/icons:${config.xdg.dataHome}/icons";
        NIX_CONF_DIR = lib.mkForce "${config.home.homeDirectory}/nixos";
        GNUPGHOME = lib.mkForce "${config.home.homeDirectory}/Personal/Secret/.gnupg";

        # Languages
        CARGO_HOME = lib.mkForce "${config.home.homeDirectory}/.config/languages/cargo";
        RUSTUP_HOME = lib.mkForce "${config.home.homeDirectory}/.config/languages/rustup";

        # Other
        EDITOR = "nvim";
        TERM = "kitty-direct";
    };

    environment.pathsToLink = [
        "${config.home.homeDirectory}/Personal/Programming/Shellscripts/brave-norm";
        "${config.home.homeDirectory}/Personal/Programming/Shellscripts/brave-othr";
    ];

    # =============== HOME DIRECTORY =============== #

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
