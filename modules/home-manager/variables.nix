{ config, pkgs, lib, ... }:
{
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
        W3M_DIR = lib.mkForce "${config.xdg.dataHome}/w3m";
        WINEPREFIX = "${config.xdg.dataHome}/wine";

        # Languages
        CARGO_HOME = lib.mkForce "${config.home.homeDirectory}/.config/languages/cargo";
        RUSTUP_HOME = lib.mkForce "${config.home.homeDirectory}/.config/languages/rustup";

        # Other
        EDITOR = "nvim";
        TERM = "kitty-direct";
    };
}
