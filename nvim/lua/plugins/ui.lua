return {
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function()
      require('ibl').setup({
        enabled = true,
        debounce = 200,
        indent = {
          char = '│',
          tab_char = '│',
          smart_indent_cap = true,
          priority = 2,
        },
        whitespace = { remove_blankline_trail = true },
        -- Note: The `scope` field requires treesitter to be set up
        scope = {
          enabled = true,
          char = '┃',
          show_start = false,
          show_end = false,
          injected_languages = true,
          priority = 1000,
          include = {
            node_type = {
              ['*'] = {
                'argument_list',
                'arguments',
                'assignment_statement',
                'Block',
                'class',
                'ContainerDecl',
                'dictionary',
                'do_block',
                'do_statement',
                'element',
                'except',
                'FnCallArguments',
                'for',
                'for_statement',
                'function',
                'function_declaration',
                'function_definition',
                'if_statement',
                'IfExpr',
                'IfStatement',
                'import',
                'InitList',
                'list_literal',
                'method',
                'object',
                'ParamDeclList',
                'repeat_statement',
                'selector',
                'SwitchExpr',
                'table',
                'table_constructor',
                'try',
                'tuple',
                'type',
                'var',
                'while',
                'while_statement',
                'with',
              },
            },
          },
        },
        exclude = {
          filetypes = {
            '', -- for all buffers without a file type
            'aerial',
            'alpha',
            'big_file_disabled_ft',
            'dashboard',
            'dotooagenda',
            'flutterToolsOutline',
            'fugitive',
            'git',
            'gitcommit',
            'help',
            'json',
            'log',
            'markdown',
            'NvimTree',
            'peekaboo',
            'startify',
            'TelescopePrompt',
            'todoist',
            'txt',
            'undotree',
            'vimwiki',
            'vista',
          },
          buftypes = { 'terminal', 'nofile', 'quickfix', 'prompt' },
        },
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({
        options = {
          number = nil,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          enforce_regular_tabs = false,
          persist_buffer_sort = true,
          always_show_bufferline = true,
          separator_style = 'thin',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count) return '(' .. count .. ')' end,
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Tree',
              text_align = 'center',
              padding = 0,
            },
          },
        },
        highlights = {
          buffer_selected = { italic = false },
          diagnostic_selected = { italic = false },
          hint_selected = { italic = false },
          pick_selected = { italic = false },
          pick_visible = { italic = false },
          pick = { italic = false },
        },
      })
    end,
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require('notify').setup({
        stages = 'fade',
        on_open = function(win)
          vim.api.nvim_set_option_value('winblend', 0, { scope = 'local', win = win })
          vim.api.nvim_win_set_config(win, { zindex = 90 })
        end,
        on_close = nil,
        timeout = 3000,
        fps = 30,
        render = 'default',
        minimum_width = 50,
        level = 'INFO',
      })
      vim.notify = require('notify')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

      require('lualine').setup({
        options = {
          icons_enabled = true,
          globalstatus = true,
          theme = 'auto',
          disabled_filetypes = {
            statusline = { 'alpha', 'dashboard', 'starter' }
          },
          component_separators = { left = '', right = '' }, --  , |
          section_separators = { left = '', right = '' }, --  ,  
        },
        sections = {
          lualine_a = {
            'mode',
            {
              'searchcount',
              maxcount = 999,
              timeout = 500,
            },
          },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 1,
            },
          },
          lualine_x = {
            'encoding',
            'fileformat',
          },
          lualine_y = { 'filetype' },
          lualine_z = { 'progress', 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {
          'quickfix',
          'nvim-tree',
          'nvim-dap-ui',
          'toggleterm',
          'fugitive',
        },
      })
    end,
  },
  {
    'folke/paint.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function()
      require('paint').setup({
        highlights = {
          {
            -- filter can be a table of buffer options that should match,
            -- or a function called with buf as param that should return true.
            -- The example below will paint @something in comments with Constant
            filter = { filetype = 'lua' },
            pattern = '%s*%-%-%-%s*(@%w+)',
            hl = 'Constant',
          },
          {
            filter = { filetype = 'python' },
            pattern = '%s*([_%w]+:)',
            hl = 'Constant',
          },
        },
      })
    end,
  },
}
