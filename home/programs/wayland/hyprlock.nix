{config, lib, inputs, pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.default;

    settings = {
      disable_loading_bar = true;

      background = {
        path = lib.mkForce "${config.home.homeDirectory}/Media/Wallpapers/spaceman.png";
      };

      input-field = {
        monitor = "DP-1";
        size = "500, 70";
        outline_thickness = "0";
        dots_size = "0.2";
        dots_center = true;
        inner_color = lib.mkForce "rgba(69, 71, 90, 1.0)";
        font_color = lib.mkForce "rgba(205, 214, 244, 1.0)";
        font_family = lib.mkForce "Maple Mono NF";
        placeholder_text = "...";
        fade_on_empty = false;
      };

      label = [
        {
          monitor = "DP-1";
          text = "Welcome";
          text_align = "center";
          color = lib.mkForce "rgba(205, 214, 244, 1.0)";
          font_size = 40;
          font_family = "Maple Mono NF";
          position = "0, -200";
          halign = "center";
          valign = "top";
        }
      ];
    };
  };
}
