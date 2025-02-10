{pkgs, ...}: {
  imports = [
    ../../misc

    ../../programs/browsers/zen.nix
    ../../programs/wayland

    ../../terminal
  ];

  home = {
    username = "dexter";
    homeDirectory = "/home/dexter";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    alacritty

    playerctl
    eww
    tofi
    socat
    imagemagick
    fzf
    brave
  ];

  programs.home-manager.enable = true;
}
