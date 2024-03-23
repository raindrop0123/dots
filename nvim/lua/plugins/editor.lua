return {
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      window = {
        border = 'rounded',
      },
    },
  },
  {
    'LunarVim/bigfile.nvim',
    lazy = false,
    opts = {},
  },
}
