return {
  {
    'catppuccin/nvim',
    lazy = false,
    config = function()
      require('catppuccin').setup({
        background = { light = 'latte', dark = 'mocha' }, -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = false,
          -- Dim inactive splits/windows/buffers.
          -- NOT recommended if you use old palette (a.k.a., mocha).
          shade = 'dark',
          percentage = 0.15,
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
        styles = {
          comments = { 'bold' },
          properties = { 'italic' },
          functions = { 'bold' },
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
          treesitter = true,
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
          aerial = true,
          alpha = false,
          barbar = false,
          beacon = false,
          cmp = true,
          coc_nvim = false,
          dap = true,
          dap_ui = true,
          dashboard = true,
          dropbar = { enabled = true, color_mode = true },
          fern = false,
          fidget = true,
          flash = true,
          gitgutter = false,
          gitsigns = true,
          harpoon = false,
          headlines = false,
          hop = true,
          illuminate = true,
          indent_blankline = { enabled = true, colored_indent_levels = false },
          leap = false,
          lightspeed = false,
          lsp_saga = true,
          lsp_trouble = true,
          markdown = true,
          mason = true,
          mini = false,
          navic = { enabled = false },
          neogit = false,
          neotest = false,
          neotree = { enabled = false, show_root = true, transparent_panel = false },
          noice = false,
          notify = true,
          nvimtree = true,
          overseer = false,
          pounce = false,
          rainbow_delimiters = true,
          sandwich = false,
          semantic_tokens = true,
          symbols_outline = false,
          telekasten = false,
          telescope = {
            enabled = true,
            -- style = 'nvchad'
          },
          treesitter_context = true,
          ts_rainbow = false,
          vim_sneak = false,
          vimwiki = false,
          which_key = true,
        },
        color_overrides = {},
        highlight_overrides = {
          all = function(colors)
            return {

              -- For Builtin
              Normal = { fg = colors.text, bg = colors.base },
              NormalFloat = { fg = colors.text, bg = colors.mantle },
              FloatBorder = { fg = colors.mauve, bg = colors.mantle },
              CursorLineNr = { fg = colors.green, style = { 'bold' } },

              -- For nvim-treesitter
              ['@variable.member'] = { fg = colors.text },
              ['@keyword.function'] = { fg = colors.red, style = { 'bold' } },

              -- For mason.nvim
              MasonNormal = { link = 'NormalFloat' },

              -- For which-key.nvim
              WhichKeyBorder = { fg = colors.mauve },

              -- For fzf-lua
              FzfLuaBorder = { fg = colors.mauve },

              -- For bufferline.nvim
              BufferLineBufferSelected = { fg = colors.peach, bg = colors.mantle },
              BufferLineIndicatorSelected = { fg = colors.yellow },

              -- For indent-blankline.nvim
              IblIndent = { fg = colors.surface0 },
              IblScope = { fg = colors.surface2, style = { 'bold' } },

              -- For nvim-cmp
              Pmenu = { fg = colors.overlay2, bg = colors.base },
              PmenuBorder = { fg = colors.surface1, bg = colors.base },
              PmenuSel = { bg = colors.green, fg = colors.base },
              CmpItemAbbr = { fg = colors.overlay2 },
              CmpItemAbbrMatch = { fg = colors.blue, style = { 'bold' } },
              CmpDoc = { link = 'NormalFloat' },
              CmpDocBorder = { fg = colors.mantle, bg = colors.mantle },

              -- For fidget.nvim
              FidgetTask = { bg = colors.none, fg = colors.surface2 },
              FidgetTitle = { fg = colors.peach, style = { 'bold' } },

              -- For nvim-notify
              NotifyBackground = { bg = colors.base },

              -- For nvim-tree
              NvimTreeRootFolder = { fg = colors.rosewater },
              NvimTreeIndentMarker = { fg = colors.surface2 },

              -- For trouble.nvim
              TroubleNormal = { bg = colors.base },

              -- For telescope.nvim
              TelescopeMatching = { fg = colors.lavender },
              TelescopeResultsDiffAdd = { fg = colors.green },
              TelescopeResultsDiffChange = { fg = colors.yellow },
              TelescopeResultsDiffDelete = { fg = colors.red },
              TelescopePreviewBorder = { fg = colors.lavender },
            }
          end
        }
      })
      vim.api.nvim_command([[colorscheme catppuccin]])
    end
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require('tokyonight').setup({
        style = 'night',
        light_style = 'day',
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'dark',
          floats = 'dark',
        },
        sidebars = { 'qf', 'help' },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = true,
        lualine_bold = true,
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })
      -- vim.api.nvim_command([[colorscheme tokyonight]])
    end,
  },
}
