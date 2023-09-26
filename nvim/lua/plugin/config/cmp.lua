return function()
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local border = function(hl)
    return {
      { '╭', hl },
      { '─', hl },
      { '╮', hl },
      { '│', hl },
      { '╯', hl },
      { '─', hl },
      { '╰', hl },
      { '│', hl },
    }
  end
  require('cmp').setup({
    window = {
      completion = {
        border = border('PmenuBorder'),
        winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel',
        scrollbar = false,
      },
      documentation = {
        border = border('CmpDocBorder'),
        winhighlight = 'Normal:CmpDoc',
      },
    },
    sorting = {
      priority_weight = 2,
    },
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = function(entry, vim_item)
        vim_item.menu = setmetatable({
          cmp_tabnine = '[TN]',
          copilot = '[CPLT]',
          buffer = '[BUF]',
          orgmode = '[ORG]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[LUA]',
          path = '[PATH]',
          tmux = '[TMUX]',
          treesitter = '[TS]',
          latex_symbols = '[LTEX]',
          luasnip = '[SNIP]',
          spell = '[SPELL]',
        }, {
          __index = function()
            return '[BTN]' -- builtin/unknown source names
          end,
        })[entry.source.name]

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
          vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'))
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = require('cmp').mapping(function(fallback)
        if require('cmp').visible() then
          require('cmp').select_prev_item()
        elseif require('luasnip').jumpable(-1) then
          vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
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
      { name = 'nvim_lsp', max_item_count = 350 },
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
