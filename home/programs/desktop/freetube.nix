{pkgs, ...}: {
  programs.freetube = {
    enable = true;
    package = pkgs.freetube;
    settings = {
      defaultQuality = "1440";
      baseTheme = "catppuccinMocha";
    };
  };
}
