{lib, pkgs, ...}: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = lib.mkForce {
      location = "center";
      width = 800;
    };

    style = lib.mkForce ''
      * {
        font-family: "Maple Mono NF";
        font-size: 18px;
        color: #cdd6f4;
      }

      window {
        font-family: "Maple Mono NF";
        font-size: 12px;

        margin: 5px;
        background-color: #181825;
      }

      #input {
        margin: 5px;
        background-color: #1e1e2e;
      }

      #entry {
        background-color: #181825;
      }

      #entry:selected {
        background-color: #181825;
      }
  
      #text:selected {
        color: #a6e3a1;
      }
    '';
  };
}
