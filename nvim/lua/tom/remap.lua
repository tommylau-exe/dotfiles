vim.g.mapleader = " "

-- write/quit
vim.keymap.set("n", "<leader>ww", vim.cmd.write)
vim.keymap.set("n", "<leader>wa", vim.cmd.wall)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>qq", vim.cmd.q)
vim.keymap.set("n", "<leader>qa", vim.cmd.qall)

-- buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bp", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- netrw
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- yank/paste remaps
vim.keymap.set("n", "<leader>cy", "\"+y")
vim.keymap.set("v", "<leader>cy", "\"+y")
vim.keymap.set("n", "<leader>cp", "\"+p")
