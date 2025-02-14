{inputs, config, ...}: {
  programs.eww = {
    enable = true;
    package = inputs.eww.packages.${pkgs.system}.default;
    configDir = "${config.home.homeDirectory}/.config/eww";
  };

  # Keeps the Eww daemon open
  systemd.user.services.eww = {
    Enable = true;
    Description = "Eww Daemon";
    Service = {
      ExecStart = "${inputs.eww.packages.${pkgs.system}.default}/bin/eww daemon";
      Restart = "always";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Open the Eww bar on startup
  systemd.user.services.eww-open = {
    Enable = true;
    Description = "Open The Main Eww Bar";
    After = [ "eww.service" "graphical-session.target" ];
    Wants = [ "eww.service" ];
    Service = {
      Type = "oneshot";
      ExecStart = "$inputs.eww.packages.${pkgs.system}.default}/bin/eww open bar";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
