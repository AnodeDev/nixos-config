{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    package = inputs.hyprpaper.packages.${pkgs.system}.default;

    settings = {
      preload = ["${config.home.homeDirectory}/Media/Wallpapers/red-landscape.png"];
      wallpaper = [
        "HDMI-A-1, ${config.home.homeDirectory}/Media/Wallpapers/red-landscape.png"
        "DP-1, ${config.home.homeDirectory}/Media/Wallpapers/red-landscape.png"
      ];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
