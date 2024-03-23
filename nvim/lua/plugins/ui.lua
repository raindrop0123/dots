return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      enabled = true,
      debounce = 200,
      whitespace = { remove_blankline_trail = true },
      indent = {
        char = '│',
        tab_char = '│',
        smart_indent_cap = true,
        priority = 2,
      },
      scope = {
        char = '┃',
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      options = {
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            padding = 0,
          },
        },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          statusline = {
            'alpha',
            'dashboard',
            'starter',
          },
        },
        component_separators = { left = '', right = '' }, -- , , │, , , , , , 
        section_separators = { left = '', right = '' }, -- , , , 
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      vim.notify = require('notify')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
}
