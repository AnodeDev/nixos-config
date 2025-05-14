{
  inputs,
  pkgs,
  self,
  lib,
  ...
}: {
  imports = [
    ./hyprland
    ./maomaowm
    ./river
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    clipse
    wlr-randr
    wlopm
    way-displays
    waylock
  ];

  systemd.user.targets.tray.Unit.Requires = lib.mkForce ["graphical-session.target"];
}
