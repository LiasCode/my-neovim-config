vim.g.mapleader = ' ';
vim.g.maplocalleader = ' ';

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true });
vim.keymap.set("n", "Q", "<nop>");
vim.keymap.set({ "n", "i", "v", "x" }, "<C-l>", "<Esc>");

-- [[ Formatting ]]
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format);

-- [[ Change all occurrences of the word under cursor ]]
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]);

-- [[ Move Lines Quickly ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

-- [[ Append next line at the end ]]
vim.keymap.set("n", "J", "mzJ`z");

-- [[ Scrolling ]]
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]);

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]);
vim.keymap.set("n", "<leader>Y", [["+Y]]);
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]);

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>");

--  Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
});

vim.keymap.set("n", "<leader>ef", function() vim.cmd 'Ex' end);
vim.keymap.set("n", "<C-l>", function () vim.cmd 'bnext'  end);
vim.keymap.set("n", "<C-h>", function () vim.cmd 'bprevious'  end);
vim.keymap.set("n", "<leader>bd", function () vim.cmd 'bdelete'  end);
