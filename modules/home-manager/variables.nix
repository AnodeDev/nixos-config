{
  config,
  lib,
  ...
}:
{
  options.variables = {
    enable = lib.mkEnableOption "enable session variables";
    xdg = lib.mkEnableOption "set XDG variables";
    cleaning = lib.mkEnableOption "enable the home directory cleaning variables";
    languages = lib.mkEnableOption "set programming language paths to .config";
    nvim = lib.mkEnableOption "set neovim as EDITOR";
    kitty = lib.mkEnableOption "set kitty as TERM";
  };

  config = lib.mkIf config.variables.enable {
    home.sessionVariables = lib.mkMerge [
      (lib.mkIf config.variables.xdg {
        XDG_DATA_HOME = lib.mkForce "${config.home.homeDirectory}/.local/share";
        XDG_STATE_HOME = lib.mkForce "${config.home.homeDirectory}/.local/state";
        XDG_CACHE_HOME = lib.mkForce "${config.home.homeDirectory}/.cache";
        XDG_CONFIG_HOME = lib.mkForce "${config.home.homeDirectory}/.config";
      })

      (lib.mkIf config.variables.cleaning {
        GTK2_RC_FILES = lib.mkForce "${config.xdg.configHome}/gtk-2.0/gtkrc";
        XCOMPOSECACHE = lib.mkForce "${config.xdg.cacheHome}/X11/xcompose";
        XCURSOR_PATH = lib.mkForce "/usr/share/icons:${config.xdg.dataHome}/icons";
        NIX_CONF_DIR = lib.mkForce "${config.home.homeDirectory}/nixos";
        GNUPGHOME = lib.mkForce "${config.home.homeDirectory}/Personal/Secret/.gnupg";
        W3M_DIR = lib.mkForce "${config.xdg.dataHome}/w3m";
        WINEPREFIX = "${config.xdg.dataHome}/wine";
      })

      (lib.mkIf config.variables.languages {
        CARGO_HOME = lib.mkForce "${config.xdg.configHome}/languages/cargo";
        RUSTUP_HOME = lib.mkForce "${config.xdg.configHome}/languages/rustup";
        GOPATH = lib.mkForce "${config.xdg.configHome}/languages/go";
      })
      (lib.mkIf config.variables.nvim { EDITOR = "nvim"; })
      (lib.mkIf config.variables.kitty { TERM = "kitty-direct"; })
    ];
  };
}
