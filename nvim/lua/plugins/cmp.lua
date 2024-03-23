return {
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'onsails/lspkind.nvim' },
      { 'hrsh7th/cmp-cmdline' },
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
          local snippet_path = vim.fn.stdpath('config') .. '/snips/'
          if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
            vim.opt.rtp:append(snippet_path)
          end
          require('luasnip').config.set_config({
            history = true,
            update_events = 'TextChanged,TextChangedI',
            delete_check_events = 'TextChanged,InsertLeave',
          })
          require('luasnip.loaders.from_lua').lazy_load()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_snipmate').lazy_load()
        end,
      },
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            mode = 'symbol_text',
            -- menu = ({
            --   buffer = '[Buffer]',
            --   nvim_lsp = '[LSP]',
            --   luasnip = '[LuaSnip]',
            --   nvim_lua = '[Lua]',
            --   path = '[Path]',
            -- })
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-g>'] = cmp.mapping.abort(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp', max_item_count = 200 },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        experimental = {
          ghost_text = {
            hl_group = 'Whitespace',
          },
        },
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
      })
    end,
  },
}
