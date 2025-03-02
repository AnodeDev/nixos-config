{pkgs, ...}: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;

    theme = "catppuccin-mocha";
    settings = {
      main = {
        font = "Maple Mono NF:size=11";
        dpi-aware = "yes";
        pad = "10x10";
        underline-offset = 2;
      };
      scrollback = {
        lines = 5000;
      };
      cursor = {
        style = "block";
        blink = "no";
      };
    };
  };
}
