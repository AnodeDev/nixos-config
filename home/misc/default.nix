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
    bc
    obsidian
    pcsx2
    p7zip

    # Necessary (if something goes wrong)
    kitty
    neovim
  ];
}
