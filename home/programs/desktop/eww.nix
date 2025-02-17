{inputs, pkgs, config, ...}: {
  programs.eww = {
    enable = true;
    package = inputs.eww.packages.${pkgs.system}.default;
    # configDir = "${config.home.homeDirectory}/.config/eww/bar";
  };
}
