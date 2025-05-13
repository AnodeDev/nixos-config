let
  workspaces = builtins.concatLists (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 10;
      in
        builtins.toString (x + 1 - (c * 10));
    in [
      "$mod, ${ws}, workspace, ${toString (x + 1)}"
      "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
    ]
  )
  10);

  runOnce = program: "pgrep ${program} || uwsm app -- ${program}";
in {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
      "$mod, Return, exec, uwsm app -- ghostty"
      "$mod, C, killactive"

      "$mod, F, fullscreen"
      "$mod, V, togglefloating"

      "$mod, N, movefocus, l"
      "$mod, E, movefocus, d"
      "$mod, I, movefocus, u"
      "$mod, O, movefocus, r"

      "$mod SHIFT, N, movewindow, l"
      "$mod SHIFT, E, movewindow, d"
      "$mod SHIFT, I, movewindow, u"
      "$mod SHIFT, O, movewindow, r"

      "$mod SHIFT, L, exec, ${runOnce "hyprlock"}"

      "$mod, M, exec, alacritty --class clipse -e clipse"

      "$mod, P, exec, wofi --show drun"
    ]
      ++ workspaces;
  };
}
