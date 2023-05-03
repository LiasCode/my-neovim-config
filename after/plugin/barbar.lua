require('bufferline').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  hide = { extensions = false, inactive = false },
  highlight_alternate = false,
  highlight_inactive_file_icons = false,
  highlight_visible = true,
  icons = {
    filetype = { enabled = true },
    separator = {
      left = ' ▎',
    },
    inactive = {
      left = '▎',
    },
    buttons = '',
    modified = {
      button = '●',
    },
    -- Enables / disables diagnostic symbols
    diagnostics = {
      -- you can use a list
      { enabled = true, icon = 'ﬀ' }, -- ERROR
      { enabled = false },            -- WARN
      { enabled = false },            -- INFO
      { enabled = true },             -- HINT
      -- OR `vim.diagnostic.severity`
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = true },
    },
    pinned = {
      button = '車',
    }
  },
  icon_custom_colors = false,
  insert_at_end = true,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
})

local map = vim.keymap.set;
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-ca>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
