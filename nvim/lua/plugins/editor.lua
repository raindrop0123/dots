return {
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require('which-key').setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = true,
            g = true,
          },
        },
        icons = {
          breadcrumb = '',
          separator = '│',
          group = '+',
        },
        window = {
          border = 'single',
          position = 'bottom',
          margin = { 0, 0, 0, 0 },
          padding = { 0, 0, 0, 0 },
          winblend = 0,
        },
      })
    end,
  },
  {
    'folke/todo-comments.nvim',
    lazy = true,
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    config = true,
  },
  {
    'LunarVim/bigfile.nvim',
    lazy = false,
    cond = true,
    config = function()
      require('bigfile').setup({
        filesize = 2, -- size of the file in MiB
        pattern = { '*' }, -- autocmd pattern
        features = { -- features to disable
          'lsp',
          'illuminate',
          'treesitter',
          'syntax',
          'vimopts',
        },
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = true,
  },
  {
    'RRethy/vim-illuminate',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function()
      require('illuminate').configure({
        providers = {
          'regex',
          'treesitter',
          'lsp',
        },
        delay = 500,
        filetypes_denylist = {
          'DoomInfo',
          'DressingSelect',
          'NvimTree',
          'TelescopePrompt',
          'Trouble',
          'aerial',
          'alpha',
          'dashboard',
          'dirvish',
          'fugitive',
          'help',
          'neogitstatus',
          'norg',
          'toggleterm',
        },
        under_cursor = false,
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add = {
            hl = 'GitSignsAdd',
            text = '│',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn',
          },
          change = {
            hl = 'GitSignsChange',
            text = '│',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn',
          },
          delete = {
            hl = 'GitSignsDelete',
            text = '_',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
          },
          topdelete = {
            hl = 'GitSignsDelete',
            text = '‾',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
          },
          changedelete = {
            hl = 'GitSignsChange',
            text = '~',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn',
          },
        },
        on_attach = nil,
        watch_gitdir = { interval = 1000, follow_files = true },
        current_line_blame = true,
        current_line_blame_opts = { delay = 1000, virtual_text_pos = 'eol' },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = { internal = true },
      })
    end,
  },
}
