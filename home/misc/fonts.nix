{pkgs, ...}: {
  home.packages = with pkgs; [
    maple-mono.NF
    times-newer-roman
  ];
}
