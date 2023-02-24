vim.g.mapleader = " ";

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- File Explorer
-- vim.keymap.set('n', '<leader>ef', vim.cmd.Ex);
vim.keymap.set('n', '<leader>ef', vim.cmd.NvimTreeToggle);

vim.keymap.set( {'n','i','v'} , '<C-c>', '<Esc>');

-- Move traverse buffers quickly
vim.keymap.set('n', '<C-n>', ':bn<CR>')
vim.keymap.set('n', '<C-d>', ':bdelete<CR>')

-- Sync Packer Extensions
vim.keymap.set('n', '<F2>', function()
	vim.cmd 'PackerSync';
end)

-- Move lines visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever YANK without lose prev data
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

-- Change all words selected in the cursor
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- REST NVIM
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim<CR>");

