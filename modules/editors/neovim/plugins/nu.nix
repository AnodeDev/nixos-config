{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "nvim-nu" = {
        package = pkgs.vimPlugins.nvim-nu;
        setupModule = "nu";
      };
    };
  };
}
