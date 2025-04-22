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
    obsidian
    pcsx2

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
