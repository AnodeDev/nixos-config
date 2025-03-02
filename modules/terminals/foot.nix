{pkgs, ...}: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;

    theme = "catppuccin-mocha";
  };
}
