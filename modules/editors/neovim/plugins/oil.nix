{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "oil.nvim" = {
        package = pkgs.vimPlugins.oil-nvim;
        setupModule = "oil";
        setupOpts = {
          default_file_explorer = true;

          columns = [
            "permissions"
            "size"
            "mtime"
          ];

          delete_to_trash = false;
          skip_confirm_for_simple_edits = false;
          prompt_save_on_select_new_entry = true;
        };
        
        lazy = true;

        keys = [
          {
            key = "<leader>ff";
            mode = "n";
            action = "<CMD>Oil<CR>";
          }
        ];
      };
    };
  };
}
