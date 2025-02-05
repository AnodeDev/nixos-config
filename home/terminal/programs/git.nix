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

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    userEmail = "dexterhedman05@proton.me";
    userName = "Dexter Hedman";
  };
}
