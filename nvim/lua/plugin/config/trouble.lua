local icon = {
  ui = require('plugin.util.icon').get('ui'),
  diagnostics = require('plugin.util.icon').get('diagnostics'),
}

local config = {
  position = 'bottom',
  height = 15,
  width = 50,
  icons = true,
  mode = 'document_diagnostics',
  group = true,
  padding = true,
  action_keys = {
    close = 'q',
    cancel = '<Esc>',
    refresh = 'r',
    jump = { '<CR>', '<TAB>' },
    open_split = { '<C-x>' },
    open_vsplit = { '<C-v>' },
    open_tab = { '<C-t>' },
    jump_close = { 'o' },
    toggle_mode = 'm',
    toggle_preview = 'P',
    hover = 'K',
    preview = 'p',
    close_folds = { 'zM', 'zm' },
    open_folds = { 'zR', 'zr' },
    toggle_fold = { 'zA', 'za' },
    previous = 'k',
    next = 'j',
  },
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = true,
  auto_fold = false,
  auto_jump = { 'lsp_definitions' },
  signs = {
    -- icons / text used for a diagnostic
    error = icon.diagnostics.Error_alt,
    warning = icon.diagnostics.Warning_alt,
    hint = icon.diagnostics.Hint_alt,
    information = icon.diagnostics.Information_alt,
    other = icon.diagnostics.Question_alt,
  },
  use_diagnostic_signs = false,
}

return function()
  require('trouble').setup(config)
end
