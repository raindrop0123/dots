return {
  {
    -- TODO: Strange setup for highligt brackets, need to search a more excellent
    -- plugin for rainbow brackets.
    'HiPhish/rainbow-delimiters.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      -- require('rainbow-delimiters.setup').setup({})
      require('rainbow-delimiters').enable(0)
    end,
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      icons = {
        breadcrumb = '',
        separator = '│',
        group = '+',
      },
      window = {
        border = 'single',
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'LunarVim/bigfile.nvim',
    lazy = false,
    cond = true,
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
}
