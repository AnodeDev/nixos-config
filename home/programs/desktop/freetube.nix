{pkgs, ...}: {
  programs.freetube = {
    enable = true;
    package = pkgs.freetube;
    settings = {
      # Theme
      baseTheme = "catppuccinMocha";
      mainColor = "CatppuccinMochaPink";
      secColor = "CatppuccinMochaGreen";

      # Player
      defaultQuality = "1440";
      useSponsorBlock = true;
      defaultViewingMode = "theatre";

      # UI
      hideTrendingVideos = true;
      hidePopularVideos = true;
    };
  };
}
