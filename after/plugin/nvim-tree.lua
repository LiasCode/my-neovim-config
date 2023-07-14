vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("nvim-tree").setup({
  sort_by = "type",
  view = {
    width = 30,
  },
  disable_netrw = true,
  renderer = {
    group_empty = false,
    add_trailing = true,
  },
  filters = {
    dotfiles = false,
    -- custom = { "^.git$", "^node_modules$" }
  },
  git = {
    enable = true,
    ignore = false,
  },
});

-- vim.keymap.set("n", "<leader>ef", "<Esc>:Ex<CR>");
vim.keymap.set("n", "<leader>ef", ":NvimTreeToggle<CR>");

-- Move traverse buffers quickly
vim.keymap.set('n', '<C-n>', ':bnext<CR>');
vim.keymap.set('n', '<C-b>', ':bprevious<CR>');
vim.keymap.set('n', '<C-d>', ':bdelete<CR>');
