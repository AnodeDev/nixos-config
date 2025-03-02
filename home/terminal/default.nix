{config, ...}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./programs
    ./shells/zsh
    ./shells/nu
  ];

  home.sessionVariables = {
    LESSHISTFILE = "${cache}/less/history";

    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";

    NIX_AUTO_RUN = "1";
  };
}
