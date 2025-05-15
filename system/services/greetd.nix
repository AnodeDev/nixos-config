{ pkgs, ...}: 
let
  UWSM_STARTUP = pkgs.writeShellScript "greeter-session" ''
            echo "Launching UWSM at $(date)" >> /tmp/uwsm-launch.log
            echo "TTY: $(tty)" >> /tmp/uwsm-launch.log
            echo "WAYLAND_DISPLAY: $WAYLAND_DISPLAY" >> /tmp/uwsm-launch.log

            if [ "$(tty)" = "/dev/tty1" ] && [ -z "$WAYLAND_DISPLAY" ]; then
              exec ${pkgs.uwsm}/bin/uwsm start select
            else
              echo "Conditions not met, dropping to shell" >> /tmp/uwsm-launch.log
              exec ${pkgs.runtimeShell} -l
            fi
          '';
in {
  environment.systemPackages = with pkgs; [ greetd.tuigreet ];

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${UWSM_STARTUP} --time --asterisks";
        user = "greeter";
      };
      terminal.vt = 1;
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    extraGroups = [ "video" "input" "seat" ];
  };
  users.groups.greeter = {};

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
