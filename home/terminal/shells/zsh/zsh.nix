{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.dataHome}/zsh_history";
      ignoreAllDups = true;
      ignoreSpace = true;
    };
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza -l";
      la = "eza -la";
      passpers = "PASSWORD_STORE_DIR=~/Personal/Secret/.pass/personal pass";
      passprof = "PASSWORD_STORE_DIR=~/Personal/Secret/.pass/professional pass";
    }
      // lib.optionalAttrs config.programs.bat.enable {cat = "bat";};

    shellGlobalAliases = {eza = "eza --icons --git";};

    profileExtra = ''
      echo "ZPROFILE LOADED" >> /tmp/zprofile-debug.log

      if [ "$(tty)" = "/dev/tty1" ] && [ -z "$WAYLAND_DISPLAY" ]; then
        exec ${pkgs.uwsm}/bin/uwsm start select
      fi
    '';
  };
}
