{ lib, ... }: {
  imports = [
    ./nixos/main-user.nix
    ./nixos/nh.nix
    ./ricing/stylix.nix
  ];
}
