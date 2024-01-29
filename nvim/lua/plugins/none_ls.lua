return {
  {
    'nvimtools/none-ls.nvim',
    lazy = true,
    event = { 'InsertEnter' },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'jay-babu/mason-null-ls.nvim',
        config = function()
          require('mason-null-ls').setup({
            ensure_installed = {
              'clang_format',
              'vint',
              'stylua',
              'prettier',
            },
            automatic_installation = false,
            automatic_setup = true,
            handlers = {},
          })
        end,
      },
    },
    config = function()
      local none_ls = require('null-ls')
      local btns = none_ls.builtins
      none_ls.setup({
        border = 'single',
        debug = false,
        log_level = 'warn',
        update_in_insert = false,
        sources = {
          btns.formatting.clang_format.with({
            filetypes = { 'c', 'cpp' },
            extra_args = {
              '-style={BasedOnStyle: LLVM, IndentWidth: 4}',
            },
          }),
          btns.formatting.stylua,
          btns.formatting.prettier.with({
            filetypes = {
              'vue',
              'typescript',
              'javascript',
              'typescriptreact',
              'javascriptreact',
              'yaml',
              'html',
              'css',
              'scss',
              'sh',
              'markdown',
            },
          }),
        },
      })
    end,
  },
}
