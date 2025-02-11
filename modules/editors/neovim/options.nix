{
  programs.nvf = {
    settings.vim.options = {
      number = true;
      relativenumber = true;
      showmatch = false;
      swapfile = false;
      ignorecase = true;
      smartcase = true;
      showmode = false;
      hidden = true;
      encoding = "utf-8";
      termguicolors = true;

      smartindent = true;
      autoindent = true;
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;

      signcolumn = "yes";
      cmdheight = 1;
      breakindent = true;

      lazyredraw = true;
      hlsearch = true;
      incsearch = true;

      backup = false;
      writebackup = false;

      clipboard = "unnamedplus";
    };
  };
}
