vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim',       opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },

    {
      "nvim-tree/nvim-tree.lua",
      config = function()
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
            custom = { "^.git$" }
          },
        })
      end
    },

    {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {}
      end
    },

    {
      'nvim-tree/nvim-web-devicons',
      config = function()
        require 'nvim-web-devicons'.setup {
          color_icons = true,
          default = true,
          strict = true,
        }
      end
    },

    { "nvim-treesitter/nvim-treesitter-context" },

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },
    {
      -- Adds git releated signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        -- See `:help gitsigns.txt`
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
      config = function()
        require("onedarkpro").setup({
          options = {
            transparency = true,
            cursorline = true,
          },
          styles = {
            types = "NONE",
            methods = "NONE",
            numbers = "NONE",
            strings = "NONE",
            comments = "italic",
            keywords = "bold,italic",
            constants = "NONE",
            functions = "bold",
            operators = "NONE",
            variables = "NONE",
            parameters = "NONE",
            conditionals = "italic",
            virtual_text = "bold,italic",
          }
        });
        vim.cmd.colorscheme('onedark_vivid');
      end,
    },

    {
      'lukas-reineke/indent-blankline.nvim',
      opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
      },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim',                  opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim',          version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup()
        vim.keymap.set({ 'i', 'n' }, '<leader>tt', '<Esc>:ToggleTerm<CR>');
      end
    },

    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ":TSUpdate",
    },

    {
      'romgrk/barbar.nvim',
      config = function()
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

        local map = vim.api.nvim_set_keymap
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
      end
    },

    {
      'nvim-lualine/lualine.nvim', -- Fancier statusline
      config = function()
        require('lualine').setup({
          options = {
            icons_enabled = true,
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
          }
        })
      end
    },

    {
      'yamatsum/nvim-cursorline',
      config = function()
        require('nvim-cursorline').setup {
          cursorline = {
            enable = false,
            timeout = 1000,
            number = false,
          },
          cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
          }
        }
      end
    },

    { "nvim-lua/plenary.nvim" },

    {
      "rest-nvim/rest.nvim",
      config = function()
        vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { noremap = true })
        require("rest-nvim").setup({
          result_split_horizontal = false,
          result_split_in_place = false,
          skip_ssl_verification = false,
          encode_url = true,
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            show_url = true,
            show_http_info = true,
            show_headers = true,
            formatters = {
              json = "jq",
              html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
              end
            },
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    },

    {
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
      config = function()
        local handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ('  %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- str width returned from truncate() may less than 2nd argument, need padding
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, 'MoreMsg' })
          return newVirtText
        end

        require('ufo').setup({
          fold_virt_text_handler = handler,
          provider_selector = function()
            return { 'treesitter', 'indent' }
          end
        })

        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      end
    },

  },
  {}
)

-- [[ Setting options ]]
-- Set highlight on search
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'

vim.cmd 'set clipboard+=unnamedplus'
vim.o.breakindent = true
vim.o.linebreak = false
vim.o.wrap = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.colorcolumn = "100"
vim.opt.scrolloff = 10
vim.opt.isfname:append("@-@")

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ef", ":NvimTreeToggle<CR>");

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'python',
    'rust',
    'tsx',
    'typescript',
    'vimdoc',
    'vim',
    'http',
    'json'
  },
  auto_install = false,
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = { 'python' }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

vim.cmd('autocmd BufRead,BufNewFile *.jsx set filetype=typescript.tsx')
vim.cmd('autocmd BufRead,BufNewFile *.http set filetype=http')

-- Quit Console
vim.cmd "tnoremap <Esc><Esc> <C-\\><C-n><CR>"

-- Move traverse buffers quickly
vim.keymap.set('n', '<C-n>', ':bn<CR>')
vim.keymap.set('n', '<C-d>', ':bdelete<CR>')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
