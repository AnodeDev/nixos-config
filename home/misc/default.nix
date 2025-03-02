{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    # Media
    freetube
    sayonara
    streamlink
    streamlink-twitch-gui-bin

    # Social
    vesktop

    # Tools
    pass
    mupdf

    # Necessary (if something goes wrong)
    kitty
  ];
}
