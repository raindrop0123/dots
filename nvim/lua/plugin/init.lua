return {
  {
    'catppuccin/nvim',
    lazy = false,
    -- event = 'InsertEnter',
    -- priority = 1000,
    config = require('plugin.config.catppuccin'),
  },
  {
    'folke/noice.nvim',
    lazy = true,
    event = 'CmdlineEnter',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
    config = require('plugin.config.noice'),
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'InsertEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugin.config.lualine'),
  },
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'InsertEnter',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugin.config.bufferline'),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.config.indent-blankline'),
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.config.gitsigns'),
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugin.config.notify'),
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile', 'NvimTreeFindFileToggle', 'NvimTreeRefresh' },
    config = require('plugin.config.nvim-tree'),
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm', 'ToggleTermSetName', 'ToggleTermToggleAll', 'ToggleTermSendVisualLines', 'ToggleTermSendCurrentLine', 'ToggleTermSendVisualSelection' },
    config = require('plugin.config.toggleterm'),
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = require('plugin.config.trouble'),
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugin.config.which-key'),
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = {
          { 'kkharji/sqlite.lua' },
        }
      },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = require('plugin.config.telescope'),
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    cmd = { 'HopAnywhere', 'HopLine' },
    config = function() require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' }) end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'InsertEnter',
    build = function()
      if #vim.api.nvim_list_uis() ~= 0 then
        vim.api.nvim_command('TSUpdate')
      end
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = require('plugin.config.ts-context'),
      },
      {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end,
      },
      {
        'p00f/nvim-ts-rainbow',
      },
    },
    config = require('plugin.config.treesitter'),
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function() require('Comment').setup() end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
  },
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup() end,
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = require('plugin.config.luasnip'),
      },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
    },
    config = require('plugin.config.cmp'),
  },
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'ray-x/lsp_signature.nvim',
        config = require('plugin.config.lsp-signature'),
      }
    },
    config = require('plugin.config.lsp'),
  },
  {
    'RRethy/vim-illuminate',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.config.vim-illuminate'),
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    config = require('plugin.config.lspsaga'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    cmd = {
      'DapSetLogLevel',
      'DapShowLog',
      'DapContinue',
      'DapToggleBreakpoint',
      'DapToggleRepl',
      'DapStepOver',
      'DapStepInto',
      'DapStepOut',
      'DapTerminate',
    },
    dependencies = {
      { 'rcarriga/nvim-dap-ui' }
    },
  },
}
