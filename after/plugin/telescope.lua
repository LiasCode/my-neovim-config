-- [[ Configure Telescope ]]
require('telescope').setup({
  defaults = {
    selection_caret = " ❯ ",
    entry_prefix = "  ",
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
});

-- Enable telescope fzf native, if installed
require('telescope').load_extension("fzf");


