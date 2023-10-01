return function()

  local icon = {
    kind = require('plugin.util.icon').get('kind'),
    type = require('plugin.util.icon').get('type'),
    cmp = require('plugin.util.icon').get('cmp'),
  }

  require('cmp').setup({
    window = {
      completion = require('cmp').config.window.bordered({
        scrollbar = false,
        border = {
          { '┌', 'PmenuBorder' },
          { '─', 'PmenuBorder' },
          { '┐', 'PmenuBorder' },
          { '│', 'PmenuBorder' },
          { '┘', 'PmenuBorder' },
          { '─', 'PmenuBorder' },
          { '└', 'PmenuBorder' },
          { '│', 'PmenuBorder' },
        },
        winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel',
      }),
      documentation = require('cmp').config.window.bordered({
        border = {
          { '┌', 'CmpDocBorder' },
          { '─', 'CmpDocBorder' },
          { '┐', 'CmpDocBorder' },
          { '│', 'CmpDocBorder' },
          { '┘', 'CmpDocBorder' },
          { '─', 'CmpDocBorder' },
          { '└', 'CmpDocBorder' },
          { '│', 'CmpDocBorder' },
        },
        winhighlight = 'Normal:CmpDoc',
      }),
    },
    sorting = {
      priority_weight = 2,
    },
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = function(entry, vim_item)
        local lspkind_icon = vim.tbl_deep_extend('force', icon.kind, icon.type, icon.cmp)
        -- vim_item.kind = string.format(' %s  %s', lspkind_icon[vim_item.kind] or icon.cmp.undefined, vim_item.kind or '')
        vim_item.kind = string.format(' %s ', lspkind_icon[vim_item.kind] or icon.cmp.undefined)
        vim_item.menu = setmetatable(
        {
          buffer = '[BUF]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[LUA]',
          path = '[PATH]',
          luasnip = '[SNIP]',
        },
        {
          __index = function()
            return '[BTN]' -- builtin/unknown source names
          end,
        }
        )[entry.source.name]

        local label = vim_item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, 80)
        if truncated_label ~= label then
          vim_item.abbr = truncated_label .. '...'
        end
        return vim_item
      end,
    },
    matching = {
      disallow_partial_fuzzy_matching = false,
    },
    performance = {
      async_budget = 1,
      max_view_entries = 120,
    },
    mapping = require('cmp').mapping.preset.insert({
      ['<CR>'] = require('cmp').mapping.confirm({ select = true, behavior = require('cmp').ConfirmBehavior.Replace }),
      ['<C-p>'] = require('cmp').mapping.select_prev_item(),
      ['<C-n>'] = require('cmp').mapping.select_next_item(),
      ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
      ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
      ['<C-w>'] = require('cmp').mapping.close(),
      ['<Tab>'] = require('cmp').mapping(function(fallback)
        if require('cmp').visible() then
          require('cmp').select_next_item()
        elseif require('luasnip').expand_or_locally_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true))
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = require('cmp').mapping(function(fallback)
        if require('cmp').visible() then
          require('cmp').select_prev_item()
        elseif require('luasnip').jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
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
end
