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
      preload = [
        "${config.home.homeDirectory}/Media/Wallpapers/moon-friend.png"
        "${config.home.homeDirectory}/Media/Wallpapers/dragon-slayer.png"
        "${config.home.homeDirectory}/Media/Wallpapers/pixel-sky.png"
      ];
      wallpaper = [
        "HDMI-A-1, ${config.home.homeDirectory}/Media/Wallpapers/pixel-sky.png"
        "DP-1, ${config.home.homeDirectory}/Media/Wallpapers/pixel-sky.png"
      ];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
