{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./wallpaper.png;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    polarity = "dark";

    targets = {
      gtk.enable = true;
      nixos-icons.enable = true;
      qt.enable = true;
    };
  };
}
