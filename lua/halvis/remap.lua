vim.g.mapleader = " "

-- Better window navigation --
vim.keymap.set("n", "<C-A-Left>", "<C-w>h")
vim.keymap.set("n", "<C-A-Down>", "<C-w>j")
vim.keymap.set("n", "<C-A-Up>", "<C-w>k")
vim.keymap.set("n", "<C-A-Right>", "<C-w>l")

-- Move text up and down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
