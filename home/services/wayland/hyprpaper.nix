{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    package = inputs.hyprpaper.packages.${pkgs.system}.default;

    settings = {
      preload = ["${config.home.homeConfig}/Media/Wallpapers/hex-landscape.png"];
      wallpaper = ["${config.home.homeConfig}/Media/Wallpapers/hex-landscape.png"];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
