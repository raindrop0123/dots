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
config.color_scheme = 'Default Dark (base16)'

-- Font
config.font_size = 13.5
config.font = wezterm.font('JetBrainsMono Nerd Font', { italic = false })
config.line_height = 1.1

-- UI
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

-- Do not show confirm message when closing window
config.window_close_confirmation = 'NeverPrompt'

return config
