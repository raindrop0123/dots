return function()

  local icon = {
    ui = require('util.icon').get('ui'),
    diagnostics = require('util.icon').get('diagnostics'),
  }

  require('trouble').setup({
    position = 'bottom',
    height = 15,
    width = 50,
    icons = true,
    mode = 'document_diagnostics',
    fold_open = icon.ui.ArrowOpen,
    fold_closed = icon.ui.ArrowClosed,
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
      error = icon.diagnostics.Error_alt,
      warning = icon.diagnostics.Warning_alt,
      hint = icon.diagnostics.Hint_alt,
      information = icon.diagnostics.Information_alt,
      other = icon.diagnostics.Question_alt,
    },
    use_diagnostic_signs = false,
  })
end
