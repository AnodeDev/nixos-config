{
  imports = [
    ../../misc

    ../../programs/browsers/zen.nix
    ../../programs/wayland

    # ../../services/wayland/hypridle.nix
    # ../../services/wayland/hyprpaper.nix

    ../../terminal
    ../../terminal/emulators/alacritty.nix
  ];

  home.packages = with pkgs; [
    playerctl
    eww
    tofi
    socat
    imagemagick
    fzf
    brave
  ];
}
