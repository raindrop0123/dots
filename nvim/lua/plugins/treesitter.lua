return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'BufReadPre',
    priority = 1000,
    build = ':TSUpdate',
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require('nvim-treesitter')`, which
      -- no longer trigger the **nvim-treeitter** module to be loaded in time.
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require('lazy.core.loader').add_to_rtp(plugin)
      require('nvim-treesitter.query_predicates')
    end,
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('treesitter-context').setup({
            enable = true,
            max_lines = 1,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            zindex = 30,
          })
        end,
      },
      { 
        'NvChad/nvim-colorizer.lua',
        config = function()
          require('colorizer').setup({})
        end,
      },
      { 
        'hiphish/rainbow-delimiters.nvim',
        config = function()
          local rainbow_delimiters = require('rainbow-delimiters')
          vim.g.rainbow_delimiters = {
            strategy = {
              [''] = rainbow_delimiters.strategy['global'],
              vim = rainbow_delimiters.strategy['local'],
            },
            query = {
              [''] = 'rainbow-delimiters',
              latex = 'rainbow-blocks',
              javascript = 'rainbow-delimiters-react',
            },
            highlight = {
              'RainbowDelimiterRed',
              'RainbowDelimiterOrange',
              'RainbowDelimiterYellow',
              'RainbowDelimiterGreen',
              'RainbowDelimiterBlue',
              'RainbowDelimiterCyan',
              'RainbowDelimiterViolet',
            },
          }
        end,
      },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'go',
          'gomod',
          'html',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'rust',
          'typescript',
          'vimdoc',
          'vim',
          'vue',
          'yaml',
          'toml',
        },

        highlight = {
          enable = true,
          disable = function(ft, bufnr)
            if vim.tbl_contains({ 'vim' }, ft) then
              return true
            end
            local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, 'bigfile_disable_treesitter')
            return ok and is_large_file
          end,
          additional_vim_regex_highlighting = false,
        },

        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']['] = '@function.outer',
              [']m'] = '@class.outer',
            },
            goto_next_end = {
              [']]'] = '@function.outer',
              [']M'] = '@class.outer',
            },
            goto_previous_start = {
              ['[['] = '@function.outer',
              ['[m'] = '@class.outer',
            },
            goto_previous_end = {
              ['[]'] = '@function.outer',
              ['[M'] = '@class.outer',
            },
          },
        },

        rainbow = {
          enable = true,
          extended_mode = true,
        },

        indent = {
          enable = true
        },

      })
    end,
  },
}
