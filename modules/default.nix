{ lib, ... }: {
  imports = [
    ./editors/neovim
    ./nixos/main-user.nix
    ./nixos/nh.nix
    ./ricing/stylix.nix
    ./terminals
  ];
}
