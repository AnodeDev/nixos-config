{
  pkgs,
  self,
  lib,
  ...
}: {
  imports = [
    ./hyprland
  ];

  home.packages = with pkgs; [
    wl-clipboard
    clipse
    wlr-randr
  ];

  systemd.user.targets.tray.Unit.Requires = lib.mkForce ["graphical-session.target"];
}
