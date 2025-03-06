{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    # Media
    freetube
    sayonara

    # Social
    vesktop

    # Tools
    pass
    mupdf

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
