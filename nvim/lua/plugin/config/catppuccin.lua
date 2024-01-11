return function()
  require('catppuccin').setup({
    flavour = 'mocha',
    background = { light = 'latte', dark = 'mocha' },
    dim_inactive = {
      enabled = false,
      shade = 'dark',
      percentage = 0.25,
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
    styles = {
      comments = { 'italic' },
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
      aerial = false,
      alpha = false,
      barbar = false,
      barbecure = {
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
        color_mode = false
      },
      fern = false,
      fidget = false,
      flash = false,
      gitsigns = true,
      harpoon = false,
      headlines = false,
      hop = true,
      indent_blankline = {
        enabled = true,
        scope_color = '',
        colored_indent_levels = false,
      },
      leap = false,
      lightspeed = false,
      lsp_saga = true,
      markdown = false,
      mini = {
        enabled = false,
        indentscope_color = '',
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false
      },
      neogit = false,
      neotest = false,
      noice = false,
      NormalNvim = false,
      notifier = false,
      cmp = true,
      dap = false,
      dap_ui = false,
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
        enabled = false
      },
      notify = true,
      semantic_tokens = false,
      nvimtree = true,
      treesitter_context = true,
      treesitter = true,
      ts_rainbow2 = false,
      ts_rainbow = true,
      ufo = false,
      window_picer = false,
      octo = false,
      overseer = false,
      pounce = false,
      rainbow_delimiters = false,
      symbols_outline = false,
      telekasten = false,
      telescope = {
        enabled = true,
        -- style = 'nvchad'
      },
      lsp_trouble = true,
      gitgutter = false,
      illuminate = {
        enabled = true,
        lsp = false,
      },
      sandwich = false,
      vim_sneak = false,
      vimwiki = false,
      which_key = true,
      mason = true,
    },
    color_overrides = {},
    highlight_overrides = {
      all = function(colors)
        return {
          -- For basic setup
          Normal = { fg = colors.text, bg = colors.crust },
          NormalFloat = { fg = colors.text, bg = colors.mantle },
          FloatBorder = { fg = colors.surface1, bg = colors.matle },
          CursorLineNr = { fg = colors.green, bg = colors.mantle },
          Comment = { fg = colors.overlay0, style = { 'italic', 'bold' } },
          ['@keyword.function'] = { fg = colors.red, style = { 'italic', 'bold' } },

          -- For native lsp configs
          DiagnosticVirtualTextError = { bg = colors.none },
          DiagnosticVirtualTextWarn = { bg = colors.none },
          DiagnosticVirtualTextInfo = { bg = colors.none },
          DiagnosticVirtualTextHint = { bg = colors.none },
          LspInfoBorder = { link = 'FloatBorder' },

          -- For mason.nvim
          MasonNormal = { link = 'NormalFloat' },

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
          CmpDocBorder = { fg = colors.surface1, bg = colors.base },

          -- For fidget.nvim
          FidgetTask = { bg = colors.none, fg = colors.surface2 },
          FidgetTitle = { fg = colors.blue, style = { 'bold' } },

          -- For bufferliine.nvim
          BufferLineBufferSelected = { fg = colors.yellow, bg = colors.mantle },
          BufferLineIndicatorSelected = { fg = colors.peach },

          -- For nvim-tree.lua
          NvimTreeRootFolder = { fg = colors.pink },
          NvimTreeIndentMarker = { fg = colors.surface2 },

          -- For trouble.nvim
          TroubleNormal = { fg = colors.base },

          -- For telescope.nvim
          TelescopeMatching = { fg = colors.lavender },
          TelescopeResultsDiffAdd = { fg = colors.green },
          TelescopeResultsDiffChange = { fg = colors.yellow },
          TelescopeResultsDiffDelete = { fg = colors.red },

          -- For nvim-treesitter
          ['@keyword.return'] = { fg = colors.pink },
          ['@error.c'] = { fg = colors.none },
          ['@error.colorsp'] = { fg = colors.none },
        }
      end,
    },
  })
  vim.api.nvim_command('colorscheme catppuccin')
end
