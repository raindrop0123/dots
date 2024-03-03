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
-- config.color_scheme = 'Sakura'

-- Font
config.font_size = 13.0
config.font = wezterm.font('Hack Nerd Font', { italic = false, weight = 'Bold' })
config.line_height = 1.15

-- UI
config.window_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true

-- Do not show confirm message when closing window
config.window_close_confirmation = 'NeverPrompt'

return config
