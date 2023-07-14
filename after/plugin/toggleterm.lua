require("toggleterm").setup();

-- Quit Console
vim.cmd "tnoremap <Esc><Esc> <C-\\><C-n><CR>"
-- Toggle Term
vim.keymap.set({ 'n' }, '<leader>tt', '<Esc>:ToggleTerm<CR>');

