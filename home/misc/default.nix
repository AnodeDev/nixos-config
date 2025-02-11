{pkgs, ...}: {
  imports = [
    ./cleanup.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    freetube
    sayonara
    vesktop
    kitty
    pass
  ];
}
