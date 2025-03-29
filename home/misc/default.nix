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

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
