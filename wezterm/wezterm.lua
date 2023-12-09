local wezterm = require('wezterm')

-- Auto-maximized Window
wezterm.on('gui-startup', function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Theme
-- config.color_scheme = 'Tomorrow Night Bright'

-- Font
config.font_size = 13.0
config.font = wezterm.font('RobotoMono Nerd Font', { italic = false })

-- Do not show confirm message when closing window
config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
