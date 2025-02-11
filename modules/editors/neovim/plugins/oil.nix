{
  programs.nvf = {
    config.vim.lazy.plugins = {
      "oil-nvim" = {
        package = pkgs.vimPlugins.oil-nvim;
        setupOpts = {
          default_file_explorer = true;
        };
        lazy = true;
      }
    };
  };
}
