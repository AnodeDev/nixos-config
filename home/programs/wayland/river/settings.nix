{lib, ...}: {
  wayland.windowManager.river = {
    extraSessionVariables = {
      mod = "Mod4";
      terminal = "ghostty";
    };

    settings = {
      border-color-focused = lib.mkForce "0xcdd6f4";
      border-color-unfocused = lib.mkForce "0xcdd6f4";
      border-width = 2;

      # Enables Server Side Decorations (SSD)
      rule-add = [
        "-app-id '*' ssd"
      ];

      default-layout = "rivertile";

      focus-output = "DP-1";
      set-focused-tags = 1;

      map = [
        "normal $mod Return spawn $terminal"
        "normal $mod C close"
        "normal $mod Space toggle-float"
        "normal $mod F toggle-fullscreen"
        "normal $mod P spawn \"wofi --show drun\""
        "normal $mod M spawn \"ghostty --class='clipse' -e clipse\""

        "normal $mod N focus-view left"
        "normal $mod E focus-view down"
        "normal $mod I focus-view up"
        "normal $mod O focus-view right"

        "normal $mod+Shift N move-view left"
        "normal $mod+Shift E move-view down"
        "normal $mod+Shift I move-view up"
        "normal $mod+Shift O move-view right"

        "normal $mod comma focus-output previous"
        "normal $mod period focus-output next"

        "normal $mod+Shift comma send-to-output previous"
        "normal $mod+Shift period send-to-output next"

        "normal $mod R enter-mode resize"
      ];
    };

    extraConfig = ''
      way-displays &
      mako &
      swww-daemon &
      swww img ~/Media/Wallpapers/pixel-city.png
      rivertile -view-padding 6 -outer-padding 6 &
      riverctl hide-cursor when-typing enabled

      for i in $(seq 1 9); do
        riverctl map normal $mod $i set-focused-tags $((1 << ($i - 1)))
        riverctl map normal $mod+Shift $i set-view-tags $((1 << ($i - 1)))
      done
    '';
  };
}
