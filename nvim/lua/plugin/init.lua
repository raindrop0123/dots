return {
  -- UI
  {
    'catppuccin/nvim',
    lazy = false,
    -- event = 'InsertEnter',
    priority = 1000,
    config = require('plugin.config.catppuccin'),
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
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'InsertEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugin.config.lualine'),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    main = 'ibl',
    event = 'InsertEnter',
    config = require('plugin.config.indent-blankline'),
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugin.config.nvim-notify'),
  },

  -- Tool
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugin.config.which-key'),
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = true,
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = require('plugin.config.trouble'),
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'InsertEnter' },
    config = require('plugin.config.gitsigns'),
  },
  {
    'RRethy/vim-illuminate',
    lazy = true,
    event = { 'InsertEnter' },
    config = require('plugin.config.vim-illuminate'),
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'InsertEnter',
    build = ':TSUpdate',
    config = require('plugin.config.nvim-treesitter'),
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = require('plugin.config.nvim-treesitter-context'),
      },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'norcalli/nvim-colorizer.lua' },
      { 'p00f/nvim-ts-rainbow' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh'
    },
    config = require('plugin.config.nvim-tree'),
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = require('plugin.config.telescope'),
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = {
      'ToggleTerm',
      'ToggleTermSetName',
      'ToggleTermToggleAll',
      'ToggleTermSendVisualLines',
      'ToggleTermSendCurrentLine',
      'ToggleTermSendVisualSelection'
    },
    config = require('plugin.config.toggleterm'),
  },
  -- Completion
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = require('plugin.config.cmp'),
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
      { 'hrsh7th/cmp-cmdline' },
    },
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
        config = require('plugin.config.lsp_signature'),
      },
    },
    config = require('plugin.config.nvim-lspconfig'),
  },
  {
    'j-hui/fidget.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.config.fidget'),
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    config = require('plugin.config.lspsaga'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
