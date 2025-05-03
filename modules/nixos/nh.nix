{pkgs, ...}: {
  environment.sessionVariables = {
    NH_FLAKE = "/home/dexter/nixos";
  };

  environment.systemPackages = with pkgs; [ nh ];
}
