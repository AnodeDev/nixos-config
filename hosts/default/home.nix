{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../../modules/home-manager/variables.nix
    ../../home/profiles/dexter
  ];

  # =============== GENERAL =============== #

  home = {
    username = "dexter";
    homeDirectory = "/home/dexter";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    # PACKAGES

    # Useful
    brave
    btop
    ripgrep
    xdg-ninja
    gnupg
    pinentry
    pass
    protonmail-bridge
    neomutt
    offlineimap
    w3m
    mailcap
    qmk
    psmisc
    rofi
    yazi
    tofi
    alacritty
    kitty
    hyprpolkitagent

    # Misc
    freetube
    vesktop
    oh-my-posh
    fzf
    mupdf
    libreoffice
    flameshot
    direnv
    sayonara
    fastfetch
    playerctl
    imagemagick
    lutris-free

    # Theming
    catppuccin-cursors.mochaDark
    sweet
    candy-icons

    # Fonts
    nerd-fonts.jetbrains-mono
    times-newer-roman
    maple-mono-NF
  ];

  variables = {
    enable = true;
    xdg = true;
    cleaning = true;
    languages = true;
    nvim = true;
    alacritty = true;
    eww = true;
  };

  # =============== CONFIGS =============== #

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # =============== GTK =============== #

  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 25;
    };

    font = {
      name = "Maple Mono NF";
      package = pkgs.maple-mono-NF;
    };
  };

  home.pointerCursor = {
    hyprcursor.enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 25;
  };

  # =============== QT =============== #

  qt = {
    enable = true;
    platformTheme.name = "gtk3";

  };

  programs.home-manager.enable = true;
}
