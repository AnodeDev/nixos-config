{
  config,
  lib,
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;

    theme = "where_is_my_sddm_theme";
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = lib.mkForce "An intelligent tiling compositor";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      river = {
        prettyName = "River";
        comment = lib.mkForce "A minimal tiling compositor";
        binPath = "/run/current-system/sw/bin/river";
      };
      maomao = {
        prettyName = "MaoMaoWM";
        comment = lib.mkForce "A minimal and pretty compositor";
        binPath = "/run/current-system/sw/bin/maomao";
      };
    };
  };
}
