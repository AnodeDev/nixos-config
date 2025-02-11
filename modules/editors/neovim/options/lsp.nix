{pkgs, ...}: {
  programs.nvf = {
    settings = {
      vim.languages = {
        enableLSP = true;

        rust.lsp = {
          enable = true;
          package = pkgs.rust-analyzer;
        };
        nix.lsp = {
          enable = true;
          package = pkgs.nil;
        };
      };
    };
  };
}
