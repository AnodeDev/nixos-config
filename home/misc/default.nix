{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
    ./gaming.nix
  ];

  home.packages = with pkgs; [
    # Media
    sayonara
    floorp
    rmpc

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
