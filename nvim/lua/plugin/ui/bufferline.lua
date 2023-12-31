return function()
  local icon = { ui = require('util.icon').get('ui') }
  require('bufferline').setup({
    options = {
      number = nil,
      modified_icon = icon.ui.Modified,
      buffer_close_icon = icon.ui.Close,
      left_trunc_marker = icon.ui.Left,
      right_trunc_marker = icon.ui.Right,
      max_name_length = 20,
      max_prefix_length = 15,
      tab_size = 20,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      persist_buffer_sort = true,
      always_show_bufferline = true,
      separator_style = 'thin',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count)
        return '(' .. count .. ')'
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          padding = 0,
        },
      },
    },
    highlights = {
      buffer_selected = { italic = false },
      diagnostic_selected = { italic = false },
      hint_selected = { italic = false },
      pick_selected = { italic = false },
      pick_visible = { italic = false },
      pick = { italic = false },
    },
  })
end
