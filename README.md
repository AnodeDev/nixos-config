# MY NIXOS CONFIG

## Introduction

I switched from Arch Linux to NixOS in July and I have not looked back. The amount of control within the NixOS configuration is amazing, way better than having to look for files all over the OS. I'm still a novice when it comes to NixOS, but this is my WIP configuration in case anyone wants a head start ;)

This configuration uses BSPWM, SXHKD and Polybar for window management using X11, which is the only one that's currently working. I'm working on implementing more and switching to Wayland, but that's not working as of right now.

## Installation

1. Clone the repo into any directory you want (I suggest either the `home` directory or the `.config` directory)
2. Use the `main-user` module to create a main user for the system
3. Set the home.nix to use your main user
4. navigate to the `root` of the directory and run:
```
sudo nixos-rebuild switch --flake .#{user}
```
(note that {user} is the name of the directory you use within the `hosts` directory)
