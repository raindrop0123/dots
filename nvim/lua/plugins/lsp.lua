return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
        opts = {
          ui = {
            border = 'rounded',
          },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = {
            'lua_ls',
          },
        },
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      require('lspconfig.ui.windows').default_options.border = 'rounded'
      -- clangd
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { 'utf-16' }
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      -- lua_ls
      lspconfig.lua_ls.setup({
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
      -- Start LSP
      vim.api.nvim_command('LspStart')
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    keys = {
      { '<leader>to', mode = { 'n' }, '<Cmd>Lspsaga outline<CR>', desc = 'Toggle: Outline' },
      { 'K', mode = { 'n' }, '<Cmd>Lspsaga hover_doc<CR>', desc = 'Hover Document' },
      { 'gd', mode = { 'n' }, '<Cmd>Lspsaga peek_definition<CR>', desc = 'Peek definition' },
      { 'gD', mode = { 'n' }, '<Cmd>Lspsaga goto_definition<CR>', desc = 'Go to definition' },
      { 'ga', mode = { 'n' }, '<Cmd>Lspsaga code_action<CR>', desc = 'Code Action' },
      { 'g[', mode = { 'n' }, '<Cmd>Lspsaga diagnostic_jump_prev<CR>', desc = 'Jump to previous diag' },
      { 'g]', mode = { 'n' }, '<Cmd>Lspsaga diagnostic_jump_next<CR>', desc = 'Jump to next diag' },
    },
    opts = {},
  },
}
