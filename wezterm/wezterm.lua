local wezterm = require('wezterm')

wezterm.on('gui-startup', function()
  local tab, pane, window = wezterm.mux.spawn_window({})
  window:gui_window():maximize()
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Theme
-- config.color_scheme = 'Vs Code Dark+ (Gogh)'
config.colors = {
  background = '#1e1e1e',
  foreground = '#cccccc',
  cursor_bg = '#ffffff',
  cursor_fg = '1e1e1e',
  cursor_border = '#ffffff',
  selection_bg = '#264f78',
  selection_fg = '#cccccc',
  ansi = {
    '#000000',
    '#f14c4c',
    '#23d18b',
    '#f5f543',
    '#3b8eea',
    '#d670d6',
    '#29b8db',
    '#e5e5e5',
  },
  brights = {
    '#666666',
    '#cd3131',
    '#0dbc79',
    '#e5e510',
    '#2472c8',
    '#bc3fbc',
    '#11a8cd',
    '#e5e5e5',
  },
}

-- Font
config.font_size = 13.5
config.font = wezterm.font('JetBrainsMono Nerd Font', { italic = false, weight = 'Bold' })
config.line_height = 1.1

-- UI
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

-- Do not show confirm message when closing window
config.window_close_confirmation = 'NeverPrompt'

return config
