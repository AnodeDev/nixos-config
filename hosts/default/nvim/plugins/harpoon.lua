local harpoon = require("harpoon")
local plenary = require("plenary")
local telescope = require("telescope")
local map = vim.keymap
local opts = { noremap = true, silent = true }

telescope.load_extension("harpoon")

map.set("n", "<leader>ht", "<CMD>Telescope harpoon marks", opts)
map.set("n", "<leader>ha", "<CMD>lua require('harpoon.mark').add_file()", opts)

plenary.setup()
harpoon.setup()
