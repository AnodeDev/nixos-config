{config, lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    monitor = [
      "HDMI-A-1, preferred, 0x0, 1"
      "DP-1, preferred, 1920x0, 1"
    ];

    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];

    exec-once = [
      "uwsm finalize"
      "clipse -listen"
      "systemctl --user start hyprpolkitagent"
      "${config.home.homeDirectory}/.config/eww/launch"
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
      smart_resizing = false;
    };

    decoration = {
      rounding = 10;
      active_opacity = 0.9;
      inactive_opacity = 0.9;

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
        color = lib.mkForce "rgba(00000055)";
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
