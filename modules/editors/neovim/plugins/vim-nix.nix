{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "vim-nix.nvim" = {
        package = pkgs.vimPlugins.vim-nix;
      };
    };
  };
}
