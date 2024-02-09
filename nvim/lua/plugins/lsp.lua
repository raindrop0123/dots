return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'VeryLazy',
    config = function()

      require('lspconfig.ui.windows').default_options.border = 'single'

      -- For clangd
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { 'utf-16' }
      require('lspconfig').clangd.setup({
        capabilities = capabilities
      })

      -- lua_ls
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
            -- Do not override treesitter lua highlighting with lua_ls's highlighting
            semantic = { enable = false },
          },
        },
      })

      -- pylsp
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

      -- Start LSP
      vim.api.nvim_command([[LspStart]])
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
    opts = {
      ui = {
        border = 'single',
        width = 0.9,
        height = 0.88,
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'clangd',
        'lua_ls',
        'pylsp',
      },
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
}
