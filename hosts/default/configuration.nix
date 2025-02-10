{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  # =============== SYSTEM SETTINGS =============== #

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Bootloader
  boot = {
    kernelParams = [ "threadirqs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Hostname
  networking = {
    hostName = "dexter";
    networkmanager.enable = true;
  };

  # Dbus
  services = {
    dbus.enable = true;
    seatd.enable = true;
  };

  # Timezone
  time.timeZone = "Europe/Stockholm";

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # TTY settings
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Audio
  services.pipewire.enable = false;

  services.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    # Change default-sample-rate to 192000 for higher res
    # Change resample-method to soxr-vhq for better resampling
    extraConfig = ''
      default-sample-format = float32le
      default-sample-rate = 96000
      alternate-sample-rate = 44100
      resample-method = speex-float-10
      default-fragments = 8
      default-fragment-size-msec = 5
      avoid-resampling = true;
    '';
  };

  # Journald
  services.journald = {
    extraConfig = ''
      SystemMaxUse=500M
      SystemKeepFree=50M
      SystemMaxFileSize=100M
      Compress=yes
    '';
  };

  # dconf
  programs.dconf.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    neovim-unwrapped
    eww
    pavucontrol
    nixfmt-rfc-style
    libsndfile

    # Programming
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      extensions = [ "rust-src" "llvm-tools-preview" ];
      targets = [ "thumbv7em-none-eabihf" ];
    }))
    go
    zig

    # Necessary packages
    pkg-config
    openssl
    gcc
    nasm
    gdb
    gnumake

    # Custom packages
    # oxide
  ];

  main-user = {
    enable = true;
    userName = "dexter";
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "dexter" = import ../../home/profiles/dexter;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.libinput.mouse.middleEmulation = false;

  # DO NOT TOUCH!!!!!
  system.stateVersion = "24.05";

  # =============== GAMING =============== #

  programs.steam = {
    enable = true;
  };

  services.udev = {
    enable = true;
    packages = with pkgs; [
      xpad
      qmk-udev-rules
    ];
  };
}
