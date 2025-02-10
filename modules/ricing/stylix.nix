{pkgs, config, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = config.home.homeDirectory + "/Media/Wallpapers/hex-landscape.png";
  };
}
