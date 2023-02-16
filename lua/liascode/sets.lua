vim.opt.guicursor = "";

vim.opt.nu = true;
vim.opt.relativenumber = true;
vim.opt.background = 'dark';
vim.opt.colorcolumn = '120';

vim.opt.autoindent = true;
vim.opt.shiftwidth = 2;
vim.opt.tabstop = 2;
vim.opt.softtabstop = 2;
vim.opt.expandtab = true;

vim.opt.smartindent = true;

vim.opt.wrap = false;

vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir";
vim.opt.undofile = true;

-- Set highlight on search
vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.scrolloff = 10;
-- Decrease update time
vim.opt.updatetime = 50;
vim.opt.signcolumn = 'yes';
vim.opt.isfname:append("@-@");

-- Enable mouse mode
vim.opt.mouse = 'a';

-- Enable break indent
vim.opt.breakindent = true;

-- Save undo history
vim.opt.undofile = true;

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true;
vim.opt.smartcase = true;


-- Set colorscheme
vim.opt.termguicolors = true;

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect';

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
});

