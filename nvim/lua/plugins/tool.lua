return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'FzfLua',
    dependencies = {
      {
        'junegunn/fzf',
        run = './install --bin',
      },
    },
    opts = {
      winopts = {
        width = 0.92,
        height = 0.88,
      }
    },
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    opts = {
      mode = 'document_diagnostics',
    },
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    opts = {},
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
    opts = {
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
    },
  },
  {
    'folke/flash.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh'
    },
    opts = {},
  },
}
