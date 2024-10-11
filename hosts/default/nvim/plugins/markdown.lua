local markdown = require("render-markdown")

markdown.setup({
    enabled = true,
    render_modes = { "n", "v", "i", "c" },
    anti_conceal = { enable = true },
})
