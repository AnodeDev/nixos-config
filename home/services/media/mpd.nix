{ pkgs, config, lib, ... }: {
  services.mpd = {
    enable = true;
    package = pkgs.mpd;

    musicDirectory = "${config.home.homeDirectory}";

    network = {
      startWhenNeeded = true;
      port = 6600;
      listenAddress = "127.0.0.1";
    };
  };
}
