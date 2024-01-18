return function()
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
end
