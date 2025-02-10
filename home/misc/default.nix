{pkgs, ...}: {
  imports = [
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    freetube
    sayonara
    vesktop
    kitty
  ];
}
