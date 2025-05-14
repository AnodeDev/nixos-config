{ lib, ... }: {
  wayland.windowManager.maomaowm = {
    settings = lib.mkForce ''
      # Animations
      animations=1
      animation_type_open=zoom
      animation_type_close=slide
      animation_fade_in=1
      tag_animation_direction=1
      zoom_initial_ratio=0.6
      fadein_begin_opacity=0.6
      fadeout_begin_opacity=0.8
      animation_duration_move=400
      animation_duration_open=350
      animation_duration_tag=350
      animation_duration_close=800
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1

      # Master layout
      new_is_master=1
      smartgaps=0
      default_mfact=0.55
      default_smfact=0.55
      default_master=1

      no_border_when_single=0
      cursor_size=24
      cursor_theme=Bibata-Modern-Ice
      cursor_hide_timeout=0

      gappih=10
      gappiv=10
      gappoh=10
      gappov=10
      borderpx=2
      rootcolor=0x1e1e2e
      bordercolor=0xcdd6f4
      focusocolor=0xf38ba8
      urgentcolor=0xf9e2af

      ##############################
      #          KEYBINDS          #
      ##############################

      # Reload config
      bind=SUPER,r,reload_config

      # Terminal + Wofi
      bind=SUPER,Return,spawn,ghostty
      bind=SUPER,P,spawn,wofi --show drun

      # Close + Kill
      bind=SUPER,c,quit
      bind=SUPER+SHIFT,c,killclient
    '';

    autostart_sh = ''
      way-displays &
      mako &
      swww-daemon &
      swww img ~/Media/Wallpapers/dragon-slayer.png
    '';
  };
}
