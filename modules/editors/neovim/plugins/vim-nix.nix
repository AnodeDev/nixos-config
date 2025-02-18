{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "vim-nix" = {
        package = pkgs.vimPlugins.vim-nix;
      };
    };
  };
}
