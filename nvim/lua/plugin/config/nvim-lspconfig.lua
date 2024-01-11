return function()

  -- nvim-lspconfig
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    virtual_text = true,
    -- set update_in_insert to false bacause it was enabled by lspsaga
    update_in_insert = false,
  })
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
  local icon = {
		ui = require('util.icon').get('ui', true),
		misc = require('util.icon').get('misc', true),
	}
  require('mason').setup({
    ui = {
      border = 'rounded',
      width = 0.85,
      height = 0.85,
      icons = {
        package_pending = icon.ui.Modified_alt,
        package_installed = icon.ui.Check,
        package_uninstalled = icon.misc.Ghost,
      },
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
  require('mason-lspconfig').setup({
    ensure_installed = {
      'clangd',
      'lua_ls',
      'pylsp',
    },
  })

  -- Start LSP after InsertEnter
  vim.api.nvim_command([[LspStart]])
end
