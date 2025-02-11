{pkgs, ...}: {
  programs.nvf = {
    settings = {
      vim.treesitter = {
        enable = true;
        highlight.enable = true;
      };

      vim.languages = {
        rust = {
          enable = true;
          treesitter.enable = true;
        };
        nix = {
          enable = true;
          treesitter.enable = true;

          format = {
            enable = true;
            package = pkgs.nixfmt;
            type = "nixfmt";
          };
        };
      };
    };
  };
}
