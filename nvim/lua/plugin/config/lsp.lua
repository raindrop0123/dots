return function()
  -- nvim-lspconfig
  require('lspconfig.ui.windows').default_options.border = 'rounded'

  -- mason
  require('mason').setup({
    ui = {
      border = 'single',
      icons = {},
      keymaps = {
        toggle_server_expand = '<CR>',
        install_server = 'i',
        update_server = 'u',
        check_server_version = 'c',
        update_all_servers = 'U',
        check_outdated_servers = 'C',
        uninstall_server = 'X',
        cancel_installation = '<C-c>',
      },
    },
  })

  -- mason-lspconfig
  require('lspconfig.ui.windows').default_options.border = 'rounded'
  require('mason-lspconfig').setup({
    ensure_installed = {
      'clangd',
      'lua_ls',
    },
  })
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

  vim.api.nvim_command([[LspStart]])
end
