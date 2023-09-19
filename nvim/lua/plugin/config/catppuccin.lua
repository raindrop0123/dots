local config = {
  flavour = 'mocha',
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
    comments = {},
    properties = {},
    functions = { 'bold' },
    keywords = { 'italic' },
    operators = { 'bold' },
    conditionals = { 'bold' },
    loops = { 'bold' },
    booleans = { 'bold' },
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
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    aerial = false,
    alpha = false,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dap = { enabled = true, enable_ui = true },
    dashboard = false,
    dropbar = { enabled = true, color_mode = true },
    fern = false,
    fidget = true,
    flash = false,
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
    symbols_outline = true,
    telekasten = false,
    telescope = { enabled = true },
    treesitter_context = true,
    ts_rainbow = false,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,
  },
  color_overrides = {},
  highlight_overrides = {
    all = function(cp)
      return {
        Comment = { fg = cp.subtext0 },

        NormalFloat = { fg = cp.text, bg = cp.mantle },
        FloatBorder = {
          fg = cp.mantle,
          bg = cp.mantle,
        },
        CursorLineNr = { fg = cp.green },

        -- For native lsp configs
        DiagnosticVirtualTextError = { bg = cp.none },
        DiagnosticVirtualTextWarn = { bg = cp.none },
        DiagnosticVirtualTextInfo = { bg = cp.none },
        DiagnosticVirtualTextHint = { bg = cp.none },
        LspInfoBorder = { link = 'FloatBorder' },

        -- For mason.nvim
        MasonNormal = { link = 'NormalFloat' },

        -- For indent-blankline
        IndentBlanklineChar = { fg = cp.surface0 },
        IndentBlanklineContextChar = { fg = cp.surface2, style = { 'bold' } },

        -- For nvim-cmp and wilder.nvim
        Pmenu = { fg = cp.overlay2, bg = cp.base },
        PmenuBorder = { fg = cp.surface1, bg = cp.base },
        PmenuSel = { bg = cp.green, fg = cp.base },
        CmpItemAbbr = { fg = cp.overlay2 },
        CmpItemAbbrMatch = { fg = cp.blue, style = { 'bold' } },
        CmpDoc = { link = 'NormalFloat' },
        CmpDocBorder = {
          fg = cp.mantle,
          bg = cp.mantle,
        },

        -- For nvim-tree
        NvimTreeRootFolder = { fg = cp.pink },
        NvimTreeIndentMarker = { fg = cp.surface2 },

        -- For trouble.nvim
        TroubleNormal = { bg = cp.base },

        -- For telescope.nvim
        TelescopeMatching = { fg = cp.lavender },
        TelescopeResultsDiffAdd = { fg = cp.green },
        TelescopeResultsDiffChange = { fg = cp.yellow },
        TelescopeResultsDiffDelete = { fg = cp.red },

        -- For treesitter
        ['@keyword.return'] = { fg = cp.pink, style = clear },
        ['@error.c'] = { fg = cp.none, style = clear },
        ['@error.cpp'] = { fg = cp.none, style = clear },
      }
    end,
  },
}

return function()
  require('catppuccin').setup(config)
end
