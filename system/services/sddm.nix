{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Maple Mono NF";
      fontSize = "11";
      background = "${./spaceman.png}";
      loginBackground = true;
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;

    theme = "catppuccin-mocha";
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = lib.mkForce "An intelligent tiling compositor";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      river = {
        prettyName = "River";
        comment = lib.mkForce "A minimal tiling compositor";
        binPath = "/run/current-system/sw/bin/river";
      };
      maomao = {
        prettyName = "MaoMaoWM";
        comment = lib.mkForce "A minimal and pretty compositor";
        binPath = "/run/current-system/sw/bin/maomao";
      };
    };
  };
}
