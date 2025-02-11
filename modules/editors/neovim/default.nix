{
  imports = [
    ./theme.nix
    ./keybinds.nix
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
    };
  };
}
