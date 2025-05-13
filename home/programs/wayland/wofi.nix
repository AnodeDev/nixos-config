{lib, pkgs, ...}: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = lib.mkForce {
      location = "top_left";
      width = 800;
      monitor = "DP-1";
    };

    style = lib.mkForce ''
      window {
        font-family = "Maple Mono NF";
        font-size = 12px;

        margin = 5px;
        border = 1px solid #cdd6f4;
        background-color = #181825;
      }

      #input {
        margin: 5px;
        border: 1px solid #f9e2af;
        background-color: #1e1e2e;
      }

      #entry {
        background-color: #181825;
      }
    '';
  };
}
