{pkgs, ...}: {
  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Utils
    jq
    pciutils
    ripgrep
    socat
    sysstat
    usbutils
    wget
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
  };
}
