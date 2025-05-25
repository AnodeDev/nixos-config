{lib, ...}: {
  wayland.windowManager.river = {
    extraSessionVariables = {
      mod = "Mod4";
      terminal = "ghostty";
    };

    settings = {
      border-color-focused = lib.mkForce "0xcdd6f4";
      border-color-unfocused = lib.mkForce "0xcdd6f4";
      border-width = 0;

      # Enables Server Side Decorations (SSD)
      rule-add = [
        "-app-id '*' ssd"
        "-app-id 'zen*' tags 1"
        "-app-id 'zen*' output HDMI-A-1"
        "-app-id '*ghostty' tags 1"
        "-app-id '*ghostty' output DP-1"
        "-title 'clipse' float"
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
        "normal $mod M spawn \"ghostty --title='clipse' -e clipse\""

        "normal $mod N focus-view left"
        "normal $mod E focus-view down"
        "normal $mod I focus-view up"
        "normal $mod O focus-view right"

        "normal $mod+Shift N swap left"
        "normal $mod+Shift E swap down"
        "normal $mod+Shift I swap up"
        "normal $mod+Shift O swap right"

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
      clipse -listen
      swww-daemon &
      swww img ~/Media/Wallpapers/landscape.png
      rivertile -view-padding 6 -outer-padding 6 &
      riverctl hide-cursor when-typing enabled

      for i in $(seq 1 5); do
        riverctl map normal $mod $i set-focused-tags $((1 << ($i - 1)))
        riverctl map normal $mod+Shift $i set-view-tags $((1 << ($i - 1)))
      done
    '';
  };
}
