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
      "eww daemon"
    ];

    general = {
      gaps_in = 10;
      gaps_out = 20;
      border_size = 3;
      "col.active_border" = lib.mkForce "rgba(f9e2afcc)";
      "col.inactive_border" = lib.mkForce "rgb(1e1e2e)";
      layout = "master";
    };

    master = {
      new_status = "slave";
      new_on_top = false;
      orientation = "left";
      smart_resizing = false;
      drop_at_cursor = true;
    };

    decoration = {
      rounding = 20;
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
        range = 7;
        render_power = 2;
        offset = "0 0";
        color = lib.mkForce "rgba(f9e2afcc)";
        color_inactive = lib.mkForce "rgb(1e1e2e)";
      };
    };

    misc = {
      disable_hyprland_logo = true;
      font_family = "Maple Mono NF";
    };

    cursor = {
      hide_on_key_press = true;
    };

    input = {
      kb_layout = "us";
    };
  };
}
