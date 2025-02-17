# MY NIXOS CONFIG

## Introduction

I switched from Arch Linux to NixOS in July and I have not looked back. The amount of control within the NixOS configuration is amazing, way better than having to look for files all over the OS. I'm still a novice when it comes to NixOS, but this is my WIP configuration in case anyone wants a head start ;)

This configuration uses Hyprland with Eww as the system bar.

## Installation

1. Clone the repo into any directory you want (I suggest either the `home` directory or the `.config` directory)
2. Use the `main-user` module to create a main user for the system
3. Set the home.nix to use your main user
4. navigate to the `root` of the directory and run:
```
sudo nixos-rebuild switch --flake .#{user}
```

or (make sure the nixosConfiguration name is the same as the networking.hostName):
```
nh os switch
```
(note that {user} is the name of the directory you use within the `hosts` directory)
