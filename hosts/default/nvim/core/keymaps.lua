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

map.set("n", "<esc>", "<CMD>nohlsearch<CR>", opts);
map.set("n", "-", "n", opts);
map.set("n", "-", "n", opts);
map.set("n", "_", "N", opts);

map.set("v", "<leader>y", '"+y', opts);

opts.desc = "Open file browser (oil)"
map.set("n", "<leader>fb", "<CMD>Oil<CR>", opts)

opts.desc = "Telescope live grep"
map.set("n", "<leader>tfg", "<CMD>Telescope live_grep<CR>", opts)

opts.desc = "Telescope git commits"
map.set("n", "<leader>tgc", "<CMD>Telescope git_commits<CR>", opts)

opts.desc = "Telescope git files"
map.set("n", "<leader>tgf", "<CMD>Telescope git_files<CR>", opts)

opts.desc = "Telescope git branches"
map.set("n", "<leader>tgb", "<CMD>Telescope git_branches<CR>", opts)
