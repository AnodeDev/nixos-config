{pkgs, ...}: {
  environment.sessionVariables = {
    FLAKE = "/home/dexter/nixos";
  };

  environment.systemPackages = with pkgs; [ nh ];
}
