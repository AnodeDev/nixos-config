local map = vim.keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Movement
map.set("n", "n", "h", opts)
map.set("n", "e", "j", opts)
map.set("n", "i", "k", opts)
map.set("n", "o", "l", opts)

-- Mode switching
map.set("n", "s", "i", opts)
map.set("n", "S", "I", opts)
map.set("n", "f", "o", opts)
map.set("n", "F", "O", opts)

map.set("v", "<leader>y", '"+y', opts);
