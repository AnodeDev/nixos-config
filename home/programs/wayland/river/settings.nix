{lib, ...}: {
  wayland.windowManager.river = {
    extraSessionVariables = {
      mod = "Mod4";
      terminal = "ghostty";
    };

    settings = {
      border-color-focused = lib.mkForce "0xa6e3a1";
      border-color-unfocused = lib.mkForce "0x1e1e2e";

      default-layout = "rivertile";

      map = [
        "normal $mod Return spawn $terminal"
        "normal $mod C close"
        "normal $mod Space toggle-float"
        "normal $mod F toggle-fullscreen"

        "normal $mod N focus-view left"
        "normal $mod E focus-view down"
        "normal $mod I focus-view up"
        "normal $mod O focus-view right"

        "normal \"$mod+Shift\" N move-view left"
        "normal \"$mod+Shift\" E move-view down"
        "normal \"$mod+Shift\" I move-view up"
        "normal \"$mod+Shift\" O move-view right"

        "normal $mod P spawn \"tofi-drun --drun-launch=true\""
      ];
    };

    extraConfig = ''
      way-displays &
      swww-daemon &
      swww img -o "HDMI-A-1" ~/Media/Wallpapers/pixel-sky.png
      swww img -o "DP-1" ~/Media/Wallpapers/pixel-sky.png
      rivertile -view-padding 6 -outer-padding 6 &
    '';
  };
}
