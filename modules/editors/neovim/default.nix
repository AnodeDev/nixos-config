{
  imports = [
    ./theme.nix
    ./keybinds.nix
    ./treesitter.nix
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
    };
  };
}
