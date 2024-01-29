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
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require('kanagawa').setup({
        compile = true,
        undercurl = true,
        commentStyle = { italic = true, bold = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = 'dragon',
        background = {
          dark = 'dragon',
          light = 'lotus'
        },
      })
      -- vim.api.nvim_command([[colorscheme kanagawa]])
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require('nightfox').setup({
        options = {
          compile_path = vim.fn.stdpath('cache') .. '/nightfox',
          compile_file_suffix = '_compiled',
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
          colorblind = {
            enable = false,
            simulate_only = false,
            severity = {
              protan = 0,
              deutan = 0,
              tritan = 0,
            },
          },
          styles = {
            comments = 'bold',
            conditionals = 'bold,italic',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
          },
          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = {},
        },
        palettes = {},
        specs = {},
        groups = {},
      })
      -- vim.api.nvim_command([[colorscheme carbonfox]])
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    config = function()
      require('rose-pine').setup({
        variant = 'auto',
        dark_variant = 'main',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',
          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',
          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
        highlight_groups = {},
        before_highlight = function(group, highlight, palette) end,
      })
      -- vim.api.nvim_command([[colorscheme rose-pine]])
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require('onedark').setup  {
        style = 'warmer',
        transparent = false,
        term_colors = true,
        ending_tildes = true,
        cmp_itemkind_reverse = false,
        toggle_style_key = nil,
        toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
        lualine = {
          transparent = false,
        },
        colors = {},
        highlights = {},
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      }
      -- vim.api.nvim_command([[colorscheme onedark]])
    end,
  },
}
