{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = "${builtins.getEnv "HOME"}/Media/Wallpapers/hex-landscape.png";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    polarity = "dark";

    targets = {
      gtk.enable = true;
      nixos-icons.enable = true;
      qt.enable = true;
    };
  };
}
