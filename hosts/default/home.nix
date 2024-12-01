{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [ ../../modules/home-manager/variables.nix ];

  # =============== GENERAL =============== #

  home.username = "dexter";
  home.homeDirectory = "/home/dexter";

  home.packages = with pkgs; [
    # PACKAGES

    # Useful
    brave
    btop
    tree
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

    # Misc
    freetube
    wtwitch
    vesktop
    oh-my-posh
    fzf
    mupdf
    libreoffice
    flameshot
    direnv
    sayonara
    pciutils
    usbutils

    # Theming
    bibata-cursors
    sweet
    candy-icons
    xbanish

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
    kitty = true;
    eww = true;
  };

  home.file = {
    "${config.xdg.dataHome}/icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
  };

  # =============== HOME DIRECTORY =============== #

  home.activation.cleanup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf ~/.gnupg
    rm -f ~/.gtkrc-2.0
    rm -rf ~/.icons
    rm -rf ~/.compose-cache
    rm -rf ~/.nix-defexpr
    rm -rf ~/.nix-profile
    rm -rf ~/.w3m
    rm -rf ~/.wine
    rm -f ~/.zcompdump
  '';

  # =============== CONFIGS =============== #

  programs = {
    git = {
      enable = true;
      userName = "Dexter Hedman";
      userEmail = "dexterhedman05@proton.me";

      ignores = [
        "*~"
        "*.swp"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    neovim =
      let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      in
      {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraLuaConfig = ''
          ${builtins.readFile ./nvim/core/options.lua}
          ${builtins.readFile ./nvim/core/keymaps.lua}
        '';

        extraPackages = with pkgs; [
          # LSP servers
          lua-language-server
          nixd
          rust-analyzer
          gopls
          clang-tools

          xclip
        ];

        plugins = with pkgs.vimPlugins; [
          # Theme
          {
            plugin = catppuccin-nvim;
            config = toLuaFile ./nvim/plugins/catppuccin.lua;
          }
          # {
          #   plugin = nord-nvim;
          #   config = toLuaFile ./nvim/plugins/nord.lua;
          # }

          # Telescope
          {
            plugin = telescope-nvim;
            config = toLuaFile ./nvim/plugins/telescope.lua;
          }
          telescope-fzf-native-nvim

          # Lualine
          {
            plugin = lualine-nvim;
            config = toLuaFile ./nvim/plugins/lualine.lua;
          }

          # Oil
          {
            plugin = oil-nvim;
            config = toLuaFile ./nvim/plugins/oil.lua;
          }

          # Treesitter
          {
            plugin = (
              nvim-treesitter.withPlugins (p: [
                p.tree-sitter-nix
                p.tree-sitter-lua
                p.tree-sitter-rust
                p.tree-sitter-bash
              ])
            );
            config = toLuaFile ./nvim/plugins/treesitter.lua;
          }

          # yuck
          {
            plugin = yuck-vim;
          }

          # LSP
          {
            plugin = nvim-lspconfig;
            config = toLuaFile ./nvim/plugins/lspconfig.lua;
          }

          # Extensions
          nvim-web-devicons
          plenary-nvim

          vim-nix
        ];
      };

    bat.enable = true;
    zoxide.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # =============== GTK =============== #

  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.theme.package = pkgs.nordic;
  gtk.theme.name = "Nordic";

  gtk.iconTheme.package = pkgs.candy-icons;
  gtk.iconTheme.name = "candy-icons";

  # =============== QT =============== #

  qt.enable = true;

  # =============== DON'T TOUCH! =============== #

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
