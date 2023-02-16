local builtin = require('telescope.builtin');

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

vim.keymap.set('n', '<leader>sf', builtin.find_files, {});

vim.keymap.set('n', '<leader>sp', builtin.git_files, {});

vim.keymap.set('n', '<leader>sg', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end);

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

