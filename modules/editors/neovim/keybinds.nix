{
  programs.nvf = {
    settings = {
      vim.keymaps = [
        # Movement
        {
          key = "n";
          mode = "n";
          action = "h";
          silent = true;
        }
        {
          key = "e";
          mode = "n";
          action = "j";
          silent = true;
        }
        {
          key = "i";
          mode = "n";
          action = "k";
          silent = true;
        }
        {
          key = "o";
          mode = "n";
          action = "l";
          silent = true;
        }

        # Mode switching
        {
          key = "s";
          mode = "n";
          action = "i";
          silent = true;
        }
        {
          key = "S";
          mode = "n";
          action = "I";
          silent = true;
        }
        {
          key = "f";
          mode = "n";
          action = "o";
          silent = true;
        }
        {
          key = "F";
          mode = "n";
          action = "O";
          silent = true;
        }

        # Misc
        {
          key = "<esc>";
          mode = "n";
          action = "<CMD>nohlsearch<CR>";
          silent = true;
        }
        {
          key = "-";
          mode = "n";
          action = "n";
          silent = true;
        }
        {
          key = "_";
          mode = "n";
          action = "N";
          silent = true;
        }
      ];
    };
  };
}
