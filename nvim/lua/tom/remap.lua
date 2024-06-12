vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- yank/paste remaps
vim.keymap.set("n", "<leader>cy", "\"+y")
vim.keymap.set("v", "<leader>cy", "\"+y")
vim.keymap.set("n", "<leader>cp", "\"+p")
