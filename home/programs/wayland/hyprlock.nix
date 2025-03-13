{config, lib, inputs, pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.default;

    settings = {
      disable_loading_bar = true;

      background = {
        path = lib.mkForce "";
        color = lib.mkForce "rgba(0, 0, 0, 1.0)";
      };

      input-field = {
        monitor = "DP-1";
        size = "500, 70";
        outline_thickness = "0";
        dots_size = "0.2";
        dots_center = true;
        inner_color = lib.mkForce "rgba(30, 30, 46, 1.0)";
        font_color = lib.mkForce "rgba(205, 214, 244, 1.0)";
        font_family = lib.mkForce "Maple Mono NF";
        placeholder_text = "...";
        fade_on_empty = false;
      };

      image = [
        {
          monitor = "DP-1";
          path = "~/Media/Pictures/sleep.png";
          size = 768;
          rounding = 0;
          border_size = 0;
          position = "0, 344";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
