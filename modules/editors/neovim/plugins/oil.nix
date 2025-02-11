{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "oil.nvim" = {
        package = pkgs.vimPlugins.oil-nvim;
        setupModule = "oil";
        setupOpts = {
        };
        
        lazy = true;

        keys = [
          {
            key = "<leader>ff";
            action = "<CMD>Oil<CR>";
          }
        ];
      };
    };
  };
}
