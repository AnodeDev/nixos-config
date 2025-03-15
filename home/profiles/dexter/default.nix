{pkgs, ...}: {
  imports = [
    ../../misc

    ../../programs/browsers/zen.nix
    ../../programs/desktop
    ../../programs/wayland
    ../../programs/security

    ../../services/wayland/hyprpaper.nix

    ../../terminal
  ];

  home = {
    username = "dexter";
    homeDirectory = "/home/dexter";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    alacritty
    ghostty

    playerctl
    tofi
    socat
    imagemagick
    fzf
  ];

  programs.home-manager.enable = true;
}
