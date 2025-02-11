{
  imports = [
    ./keybinds.nix
    ./options
    ./theme.nix
    ./treesitter.nix
    ./plugins
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
    };
  };
}
