return function()
  -- nvim-lspconfig
  require('lspconfig.ui.windows').default_options.border = 'single'
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

  -- mason
  require('mason').setup({
    ui = {
      border = 'single',
      width = 0.65,
      height = 0.6,
    },
  })

  -- mason-lspconfig
  require('mason-lspconfig').setup({
    ensure_installed = {
      'clangd',
      'lua_ls',
    },
  })

  vim.api.nvim_command([[LspStart]])
end
