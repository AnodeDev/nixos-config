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

      tag-label = [
        "1 Main 1"
        "2 Main 2"
        "3 Main 3"
        "4 Main 4"
        "5 Main 5"
        "6 Ext 1"
        "7 Ext 2"
        "8 Ext 3"
        "9 Ext 4"
        "10 Ext 5"
      ];

      output = [
        "DP-1 tags 1 2 3 4 5"
        "HDMI-A-1 tags 6 7 8 9 10"
      ];

      focus-output = "DP-1";
      set-focused-tags = 1;

      map = [
        "normal $mod Return spawn $terminal"
        "normal $mod C close"
        "normal $mod Space toggle-float"
        "normal $mod F toggle-fullscreen"
        "normal $mod P spawn \"wofi --show drun\""

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

        "resize N resize horizontal -20"
        "resize E resize vertical 20"
        "resize I resize vertical -20"
        "resize O resize horizontal 20"
        "resize Escape enter-mode normal"
      ];
    };

    extraConfig = ''
      way-displays &
      mako &
      swww-daemon &
      swww img -o "HDMI-A-1" ~/Media/Wallpapers/pixel-sky.png
      swww img -o "DP-1" ~/Media/Wallpapers/pixel-sky.png
      rivertile -view-padding 6 -outer-padding 6 &

      for i in $(seq 1 9); do
        riverctl map normal $mod $i set-focused-tags $((1 << ($i - 1)))
        riverctl map normal $mod+Shift $i set-view-tags $((1 << ($i - 1)))
      done
    '';
  };
}
