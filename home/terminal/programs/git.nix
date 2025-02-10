{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git = {
    enable = true;

    delta = {
      enable = true;
      options.dark = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    userEmail = "dexterhedman05@proton.me";
    userName = "Dexter Hedman";
  };
}
