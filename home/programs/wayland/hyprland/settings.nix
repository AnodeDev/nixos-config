{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];

    exec-once = [
      "clipse -listen"
      "${config.home.homeDirectory}/.config/hypr/eww/launch"
      "systemctl --user start hyprpolkitagent"
    ];

    general = {
      gaps_in = 10;
      gaps_out = 20;
      border_size = 0;
      layout = "dwindle";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      smart_split = false;
      smart_sesizing = false;
    };

    decoration = {
      rounding = 10;
      inactive_opacity = 0.88;

      blur = {
        enabled = true;
        size = 8;
        passes = 4;
        new_optimizations = true;
        popups = true;
      };

      shadow = {
        enabled = true;
        range = 10;
        render_power = 3;
        offset = "4 4";
        color = "rgba(00000055)";
      };
    };

    cursor = {
      hide_on_key_press = true;
    };

    input = {
      kb_layout = "us";
    };
  };
}
