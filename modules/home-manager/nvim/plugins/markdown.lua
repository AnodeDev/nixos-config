return {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local markdown = require("render-markdown")

        markdown.setup({
            enabled = true,
            render_modes = { "n", "v", "i", "c" },
            anti_conceal = { enable = true },
        })
    end
}
