{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = {
      location = "center";
    };

    style = ''
      window {
        margin = 5px;
        border = 1px solid #cdd6f4;
        background-color = #181825;
      };
    '';
  };
}
