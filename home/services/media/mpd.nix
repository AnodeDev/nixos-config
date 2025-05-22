{ pkgs, config, lib, ... }: {
  services.mpd = {
    enable = true;
    package = pkgs.mpd;

    musicDirectory = "${config.home.homeDirectory}/Media/Music";
    playlistDirectory = "${config.home.homeDirectory}/Media/Playlists";
    dbFile = "${config.xdg.cacheHome}/mpd/mpd.db";

    network = {
      startWhenNeeded = true;
      port = 6600;
      listenAddress = "127.0.0.1";
    };

    extraConfig = ''
      log_file  "~/.local/cache/mpd/mpd.log"
      audio_output {
        type    "jack"
        name    "PCH"
      }
    '';
  };
}
