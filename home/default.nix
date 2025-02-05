{
  lib,
  self,
  ...
}: {
  imports = [
    ./terminal
  ];

  programs.home-manager.enable = true;
}
