return function()

  -- nvim-lspconfig
  require('lspconfig.ui.windows').default_options.border = 'rounded'
  require('lspconfig').clangd.setup({})
  require('lspconfig').lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
          disable = { 'different-requires' },
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        format = { enable = false },
        telemetry = { enable = false },
        semantic = { enable = false },
      },
    },
  })
  require('lspconfig').pylsp.setup({
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    settings = {
      pylsp = {
        plugins = {
          -- Lint
          ruff = {
            enabled = true,
            select = {
              -- enable pycodestyle
              'E',
              -- enable pyflakes
              'F',
            },
            ignore = {
              -- ignore E501 (line too long)
              -- 'E501',
              -- ignore F401 (imported but unused)
              -- 'F401',
            },
            extendSelect = { 'I' },
            severities = {
              -- Hint, Information, Warning, Error
              F401 = 'I',
              E501 = 'I',
            },
          },
          flake8 = { enabled = false },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },

          -- Code refactor
          rope = { enabled = true },

          -- Formatting
          black = { enabled = true },
          pyls_isort = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
        },
      },
    },
  })

  -- mason
  require('mason').setup({
    ui = {
      border = 'rounded',
      width = 0.85,
      height = 0.85,
    },
  })

  -- mason-lspconfig
  require('mason-lspconfig').setup({
    ensure_installed = {
      'clangd',
      'lua_ls',
      'pylsp',
    },
  })

  vim.api.nvim_command([[LspStart]])
end
