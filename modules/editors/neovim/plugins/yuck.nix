{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "yuck.vim" = {
        package = pkgs.vimPlugins.yuck-vim;
      };
    };
  };
}
