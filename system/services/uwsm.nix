{ lib, ... }: {
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
    };
  };
}
