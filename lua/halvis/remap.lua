vim.g.mapleader = " "

-- Project view --
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Split window
vim.keymap.set("n", "<leader>vh", vim.cmd.sp)
vim.keymap.set("n", "<leader>vv", vim.cmd.vs)

-- Better window navigation --
vim.keymap.set("n", "<C-A-Left>", "<C-w>h")
vim.keymap.set("n", "<C-A-Down>", "<C-w>j")
vim.keymap.set("n", "<C-A-Uo>", "<C-w>k")
vim.keymap.set("n", "<C-A-Right>", "<C-w>l")

-- Move text up and down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
