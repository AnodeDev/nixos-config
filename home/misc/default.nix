{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    # Media
    freetube
    sayonara
    floorp

    # Social
    vesktop

    # Tools
    pass
    mupdf
    qemu

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
