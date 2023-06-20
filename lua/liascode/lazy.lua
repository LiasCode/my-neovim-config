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
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',

    {
      -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim',       opts = {}},
        { 'folke/neodev.nvim', }
      },
    },

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },


    { "nvim-tree/nvim-tree.lua", },

    {
      'nvim-tree/nvim-web-devicons',
    },


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
      "olimorris/onedarkpro.nvim",
      priority = 1000,
    },

    { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },

    {
      'lukas-reineke/indent-blankline.nvim',
      opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
      },
    },

    { 'numToStr/Comment.nvim',         opts = {} },
    { 'nvim-lua/plenary.nvim' },

    { 'nvim-telescope/telescope.nvim', version = '*' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    {
      "akinsho/toggleterm.nvim",
    },

    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ":TSUpdate",
    },
    { "nvim-treesitter/nvim-treesitter-context" },

    {
      'romgrk/barbar.nvim',
    },

    {
      'nvim-lualine/lualine.nvim', -- Fancier statusline
    },

    {
      'yamatsum/nvim-cursorline',
    },

    { "nvim-lua/plenary.nvim" },

    {
      "rest-nvim/rest.nvim",
    },

    {
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
    },
  },
  {}
);
