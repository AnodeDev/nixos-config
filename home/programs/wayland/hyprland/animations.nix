{
  wayland.windowManager.hyprland.settings = {
    animation = [
      # Windows
      "windowsIn, 1, 5, easeOutCirc"
      "windowsMove, 1, 7, easeOutExpo"
      "windowsOut, 1, 7, easeOutQuad"

      # Workspaces
      "workspaces, 1, 6, default"
    ];

    bezier = [
      "easeOutCirc, 0, 0.55, 0.45, 1"
      "easeOutQuad, 0.5, 1, 0.89, 1"
      "easeOutExpo, 0.16, 1, 0.3, 1"
    ];
  };
}
