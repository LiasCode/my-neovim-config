local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    "tpope/vim-fugitive",
    "tpope/vim-sleuth",
    "tpope/vim-vinegar",
    "gelguy/wilder.nvim",
    "brenoprata10/nvim-highlight-colors",

    "m4xshen/autoclose.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    -- "nvim-tree/nvim-tree.lua",
    "olimorris/onedarkpro.nvim",
    'romgrk/barbar.nvim',
    'nvim-lualine/lualine.nvim',
    "rest-nvim/rest.nvim",
    'nvim-tree/nvim-web-devicons',

    { 'numToStr/Comment.nvim',         opts = {} },
    'nvim-lua/plenary.nvim',
    "catppuccin/nvim",

    "Exafunction/codeium.vim", -- GPT

    -- Prettier
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',

    {
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      },
    },

    {
      -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim',       opts = {} },
        { 'folke/neodev.nvim', }
      },
    },

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
      },
    },

    { 'nvim-telescope/telescope.nvim', version = '*' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ":TSUpdate",
    },
  },
  {}
);
