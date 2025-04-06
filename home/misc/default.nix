{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    # Media
    sayonara
    floorp

    # Social
    vesktop

    # Tools
    pass
    mupdf
    qemu
    protonvpn-gui
    bc

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
