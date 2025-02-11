{pkgs, ...}: {
  programs.nvf.settings = {
    config.vim.lazy.plugins = {
      "oil.nvim" = {
        package = pkgs.vimPlugins.oil-nvim;
        setupModule = "oil";
        setupOpts = {
          default_file_explorer = true;

          columns = [
            "icon"
            "permissions"
            "size"
            "mtime"
          ];

          buf_options = {
            buflisted = false;
            bufhidden = "hide";
          };

          win_options = {
            wrap = false;
            signcolumn = "no";
            cursorcolumn = false;
            foldcolumn = "0";
            spell = false;
            list = false;
            conceallevel = 3;
            concealcursor = "nvic";
          };

          delete_to_trash = false;
          skip_confirm_for_simple_edits = false;
          prompt_save_on_select_new_entry = true;
          
          cleanup_delay_ms = 2000;
          lsp_file_methods = {
            timeout_ms = 1000;
            autosave_changes = false;
          };

          # Options:
          #   false
          #   "editable"
          #   "name"
          constrain_cursor = "name";
          watch_for_changes = false;

          view_options = {
            natural_order = true;
            case_sensitive = false;
            sort = [
              [ "type" "asc" ]
              [ "name" "asc" ]
            ];
          };

          ssh = {
            border = "rounded";
          };

          keymaps_help = {
            border = "rounded";
          };
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
