{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "startup.nvim" = {
        package = pkgs.vimPlugins.startup-nvim;
        setupModule = "startup";
        setupOpts = {
          theme = "dashboard";
        };
      };
    };
  };
}
