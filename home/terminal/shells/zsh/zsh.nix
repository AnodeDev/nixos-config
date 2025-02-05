{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.dataHome}/zsh_history";
    };

    shellAliases = {
      l = "eza -l";
      la = "eza -la";
    }
      // lib.optionalAttrs config.programs.bat.enable {cat = "bat";};

    shellGlobalAliases = {eza = "eza --icons --git";};
  };
}
