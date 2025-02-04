{pkgs, ...}: {
  programs.uwsm = {
    enable = true;

    package = pkgs.uwsm;

    waylandCompositors = {
      hyprland = {
        prettyName = "HyprLand";
        comment = "Intelligent tiling compositor";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };
}
