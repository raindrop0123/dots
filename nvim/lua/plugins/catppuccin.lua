return {
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        background = { light = 'latte', dark = 'mocha' },
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
        styles = {
          comments = { 'bold' },
          properties = { 'italic' },
          functions = { 'bold', 'italic' },
          keywords = { 'italic' },
          operators = { 'bold' },
          conditionals = { 'bold' },
          loops = { 'bold' },
          booleans = { 'bold', 'italic' },
          numbers = {},
          types = {},
          strings = {},
          variables = {},
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
          dashboard = true,
          dropbar = {
            enabled = true,
            color_mode = true
          },
          fern = false,
          fidget = false,
          flash = true,
          gitsigns = true,
          harpoon = false,
          headlines = false,
          hop = false,
          indent_blankline = {
            enabled = true,
            scope_color = 'rosewater',
            colored_indent_levels = true,
          },
          leap = false,
          lightspeed = false,
          lsp_saga = true,
          markdown = true,
          mason = true,
          mini = {
            enabled = false,
            indentscope_color = 'rosewater',
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
          rainbow_delimiters = true,
          symbols_outline = false,
          telekasten = false,
          telescope = {
            enabled = false,
            style = 'nvchad'
          },
          lsp_trouble = true,
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
        color_overrides = {},
        highlight_overrides = {
          all = function(colors)
            return {
              -- For Builtin
              Normal = { bg = colors.base, fg = colors.text },
              NormalFloat = { bg = colors.mantle, fg = colors.text },
              FloatBorder = { bg = colors.mantle, fg = colors.blue },
              CursorLineNr = { fg = colors.green, style = { 'bold' } },

              -- For nvim-treesitter
              ['@keyword.function'] = { fg = colors.red },

              -- For fzf-lua
              FzfLuaBorder = { fg = colors.blue, style = { 'bold' } },

              -- For bufferline.nvim
              BufferLineBufferSelected = { bg = colors.mantle, fg = colors.peach },
              BufferLineIndicatorSelected = { fg = colors.yellow },

              -- For indent-blankline.nvim
              IblIndent = { fg = colors.surface0 },
              IblScope = { fg = colors.blue, style = { 'bold' } },

              -- For nvim-cmp
              Pmenu = { bg = colors.mantle, fg = colors.surface1 },
              PmenuBorder = { bg = colors.mantle, fg = colors.surface1 },
              PmenuSel = { bg = colors.blue, fg = colors.base },
              CmpDoc = { bg = colors.mantle, fg = colors.text },
              CmpDocBorder = { bg = colors.mantle, fg = colors.surface1 },
            }
          end
        }
      })
      vim.api.nvim_command('colorscheme catppuccin')
    end,
  },
}
