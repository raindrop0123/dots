return {
  -- UI
  {
    'catppuccin/nvim',
    lazy = false,
    -- event = 'InsertEnter',
    -- priority = 1000,
    config = require('plugin.ui.catppuccin'),
  },
  {
    'j-hui/fidget.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.ui.fidget'),
  },
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'InsertEnter',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugin.ui.bufferline'),
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'InsertEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugin.ui.lualine'),
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugin.ui.notify'),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    main = 'ibl',
    event = 'InsertEnter',
    config = require('plugin.ui.indent-blankline'),
  },
  -- Tool
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = require('plugin.tool.trouble'),
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    cmd = { 'HopAnywhere', 'HopLine' },
    config = true,
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugin.tool.which-key'),
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
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh'
    },
    config = require('plugin.tool.nvim-tree'),
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
    config = require('plugin.tool.telescope'),
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
    config = require('plugin.tool.toggleterm'),
  },
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'InsertEnter',
    build = ':TSUpdate',
    config = require('plugin.tool.nvim-treesitter'),
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = require('plugin.tool.nvim-treesitter-context'),
      },
      { 'NvChad/nvim-colorizer.lua' },
      { 'p00f/nvim-ts-rainbow' },
    },
  },
  -- completion
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = require('plugin.completion.cmp'),
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = require('plugin.completion.luasnip'),
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
    },
    config = require('plugin.completion.nvim-lspconfig'),
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    config = require('plugin.completion.lspsaga'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
