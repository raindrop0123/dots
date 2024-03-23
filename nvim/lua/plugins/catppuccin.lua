return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = true,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { 'bold' },
          conditionals = { 'bold' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = { 'bold' },
          properties = {},
          types = {},
          operators = {},
          miscs = {},
        },
        integrations = {
          aerial = false,
          alpha = false,
          barbar = false,
          barbecue = {
            dim_dirname = false,
            bold_basename = false,
            dim_context = false,
            alt_background = false,
          },
          beacon = false,
          coc_nvim = false,
          dashboard = false,
          dropbar = {
            enabled = false,
            color_mode = false,
          },
          fern = false,
          fidget = false,
          flash = false,
          gitsigns = true,
          harpoon = false,
          headlines = false,
          hop = false,
          indent_blankline = {
            enabled = true,
            scope_color = 'lavender',
            colored_indent_levels = true,
          },
          leap = false,
          lightspeed = false,
          lsp_saga = false,
          markdown = false,
          mason = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          neotree = false,
          neogit = false,
          neotest = false,
          noice = false,
          NormalNvim = false,
          notifier = false,
          cmp = true,
          dap = true,
          dap_ui = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },
          navic = {
            enabled = false,
            custom_bg = 'NONE',
          },
          notify = true,
          semantic_tokens = false,
          nvimtree = true,
          treesitter_context = false,
          treesitter = true,
          ts_rainbow2 = false,
          ts_rainbow = false,
          ufo = false,
          window_picker = false,
          octo = false,
          overseer = false,
          pounce = false,
          rainbow_delimiters = false,
          symbols_outline = false,
          telekasten = false,
          telescope = {
            enabled = false,
            style = 'nvchad',
          },
          lsp_trouble = false,
          gitgutter = false,
          illuminate = {
            enabled = false,
            lsp = false
          },
          sandwich = false,
          vim_sneak = false,
          vimwiki = false,
          which_key = true,
        },
        color_overrides = {
          mocha = {
            mantle = '#11111b',
            base = '#11111b',
          },
        },
        custom_highlights = {},
        highlight_overrides = {
          mocha = function(colors)
            return {
              -- Builtin
              Normal = { bg = colors.crust, fg = colors.text },
              NormalFloat = { bg = colors.mantle, fg = colors.text },
              FloatBorder = { bg = colors.mantle, fg = colors.blue },
              CursorLineNr = { fg = colors.green, style = { 'bold' } },
              Pmenu = { bg = colors.mantle, fg = colors.text },
              PmenuBorder = { bg = colors.surface0, fg = colors.blue },
              PmenuSel = { bg = colors.blue, fg = colors.mantle },
              -- bufferline.nvim
              BufferLineBufferSelected = { bg = colors.mantle, fg = colors.peach },
              BufferLineIndicatorSelected = { fg = colors.yellow },
              -- nvim-cmp
              CmpItemAbbr = { fg = colors.overlay2 },
              CmpItemAbbrMatch = { fg = colors.blue, style = { 'bold' } },
              CmpDoc = { bg = colors.mantle, fg = colors.text },
              CmpDocBorder = { bg = colors.mantle, fg = colors.blue },
              -- fzf-lua
              FzfLuaBorder = { bg = colors.mantle, fg = colors.blue },
              -- mason.nvim
              MasonNormal = { bg = colors.mantle, fg = colors.text },
              -- nvim-treesitter
              ['@variable.member'] = { fg = colors.text },
              ['@keyword.function'] = { fg = colors.red },
              ['@keyword.return'] = { fg = colors.pink },
            }
          end,
        },
      })
      vim.api.nvim_command('colorscheme catppuccin')
    end,
  },
}
