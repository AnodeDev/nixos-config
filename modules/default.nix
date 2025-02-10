{ lib, ... }:

{
  imports = [
    ./nixos/main-user.nix
    ./ricing/stylix.nix
  ];
}
